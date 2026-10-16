require 'open-uri'

class Post < ApplicationRecord
  self.table_name = 'app_posts'

  attr_accessor :tagged_account_ids, :auto_crop
  
  POST_TYPES = ['video', 'image']
  
  def search_result(current_user = nil)
    item = Item.find_by(content_type: 'Post', content_id: self.id)
    Api::V1::ItemSerializer.new(item) if item.present?
  end


  belongs_to :account
  has_many :reactions, as: :resource, dependent: :destroy
  has_many :reviews, as: :relatable, dependent: :destroy
  belongs_to :parent_post, class_name: "Post", foreign_key: 'parent_id', optional: true
  has_many :reshared_posts, class_name: 'Post', foreign_key: 'parent_id', dependent: :destroy
  has_one :item, as: :content, dependent: :destroy
  belongs_to :tagged_item,  class_name: 'Item' , foreign_key: 'item_id', optional: true

  validates :media_files, presence: true
  after_create :create_item, :set_media_type
  after_save :create_tag
  after_commit :upload_transcoded_files, on: :create

  has_many_attached :media_files

  def self.search(search)
    where("caption LIKE ? or content LIKE ?", "#{search}%", "#{search}%").order('content ASC')
  end


  def create_item
    item = self.build_item(content_type: "Post", content_id: self.id, account_id: self.account.id)
    item.save
  end

  def create_tag
    return if tagged_account_ids.blank?
    item = self.item
    account_ids_arr =  tagged_account_ids[0].split(',').map{|n|eval n}
    account_ids_arr.each do |acont_id|
      if (acont_id != item.account_id &&  item.tags.pluck(:account_id).exclude?(acont_id))
        item.tags.create(account_id: acont_id)
      end
    end
  end

  def clone_post account, params
    @dup_post = self.dup
    @dup_post.account_id = account.id
    @dup_post.reshare_caption = params[:reshare_caption]
    if self.parent_post.present?
      @dup_post.parent_id = self.parent_post.id
    else
      @dup_post.parent_id = self.id
    end
    @dup_post.save
    return @dup_post
  end
  
  def set_media_type
    post_type = image_type(self.media_files.last.blob.filename.to_s)
    update_column(:post_type, post_type)
  end

  def image_type(file_path)
    extension = file_path.split('.').last.downcase
    if VIDEO_EXTENSION.include?(extension)
      "video"
    elsif IMAGE_EXTENSION.include?(extension)
      "image"
    else
      ""
    end
  end

  def upload_transcoded_files
    if media_files.present? && VIDEO_TYPE.include?(media_files[0].content_type)
      return unless ActiveModel::Type::Boolean.new.cast(auto_crop)

      file_url = media_files.first.service_url if media_files.attached?
      if file_url.present?
        file_path = URI.open(file_url).path
        TranscodeJob.perform_later(file_path, self.id)
      end
    end
  end
end
