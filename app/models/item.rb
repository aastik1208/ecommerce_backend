class Item < ApplicationRecord
  self.table_name = 'app_items'

  def search_result(current_account)
    Api::V1::ItemSerializer.new(self, scope: current_account) if self.present?
  end


  validates :content_id, :content_type, presence: true
  belongs_to :content, polymorphic: true
  has_many :reactions, as: :resource, dependent: :destroy
  has_many :reviews, as: :relatable, dependent: :destroy
  belongs_to :account
  belongs_to :parent_item, class_name: 'Item', foreign_key: 'parent_id', optional: true
  has_many :reshared_items, class_name: 'Item', foreign_key: 'parent_id', dependent: :destroy
  has_many :tags, as: :tagable, dependent: :destroy
  has_many :item_option_types, dependent: :destroy
  scope :post_type, -> { where(content_type: "Post") }
  scope :product, -> { where(content_type: "Magento::Product") }
  scope :parent_product, -> { product.where(parent_id: nil) }

  def self.search(search)
    where("reshare_caption LIKE ?", "#{search}%").order('reshare_caption ASC')
  end

  def self.non_variant_products
    configurable_product_ids = ::Magento::ProductSuperLink.pluck(:product_id)
    Item.product.where(content_id: configurable_product_ids).pluck(:id)
  end

  def clone_item account, params
    @dup_item = self.dup
    @dup_item.account_id = account.id
    @dup_item.reshare_caption = params[:reshare_caption]
    @dup_item.parent_id = self.id
    @dup_item.save
    create_tag(@dup_item, params[:tagged_account_ids])  if params[:tagged_account_ids].present?
    return @dup_item
  end
  
  def create_tag(item, tagged_account_ids)
    account_ids_arr =  tagged_account_ids[0].split(',').map{|n|eval n}
    account_ids_arr.each do |acont_id|
      if (acont_id != item.account_id &&  item.tags.pluck(:account_id).exclude?(acont_id))
        item.tags.create(account_id: acont_id)
      end
    end
  end

  def variants
    return [] unless product?
    Item.product.where(content_id: content.variants.pluck(:entity_id))
  end

  def product?
    content_type == 'Magento::Product'
  end

  def self.tagged_items(current_account)
    Item.where(id: Tag.where(account_id: current_account.id, tagable_type: "Item").order('updated_at DESC').pluck(:tagable_id))
  end
end

