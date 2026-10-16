class Account < ApplicationRecord
  self.table_name = 'app_accounts'

  validates :email, presence: true, uniqueness: true

  def search_result
    Api::V1::CustomerProfileSerializer.new(self) if self.present?
  end


  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_items, dependent: :destroy
  has_many :followers, dependent: :destroy
  has_many :follow, foreign_key: 'follow_id', class_name: 'Follower'
  has_many :account_followers, through: :follow, source: :account
  has_many :posts, dependent: :destroy
  has_many :account_preferences, foreign_key: 'account_id', class_name: 'AccountPreference', dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :reshared_items, -> {where.not(parent_id: nil)}, :class_name => 'Item'
  has_many :reviews, as: :relatable, dependent: :destroy
  has_many :reviews_given, class_name: 'Review', foreign_key: 'account_id', dependent: :destroy
  has_many :tags, as: :tagable, dependent: :destroy
  has_many :tagged_references, class_name: 'Tag', foreign_key: 'account_id', dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :user_views, dependent: :destroy

  enum role: [:user, :Influencer, :bigness]

  def self.search(search)
    where("email LIKE ? or firstname LIKE ? or lastname LIKE ?", "#{search}%", "#{search}%", "#{search}%").order('firstname ASC')
  end

  def get_store(params)
    if params[:global_store].present?
      result = Brandsday::CustomerService.new.get_product_details_for_store(params.merge(oauth_token: self.oauth_token))
    else
      magento_category_ids = self.account_preferences.order('updated_at DESC').pluck(:magento_category_id)
      result = Brandsday::CustomerService.new.get_product_details_for_store(params.merge(category_ids: magento_category_ids, oauth_token: self.oauth_token))
    end
    result["items"].present? ? Item.where(content_id: result["items"].pluck("id"), content_type: "Magento::Product").order('updated_at DESC') : Item.where(id: []).order('updated_at DESC')
  end

  def followings
    account_ids = Follower.where(account_id: self.id).collect(&:follow_id)
    Account.where(id: account_ids)
  end

  def remove_preferences(params)
    self.account_preferences.where(magento_category_id: params["preferences"].pluck(:magento_category_id)).destroy_all
  end

  def self.last_30_days
    self.where(id: UserView.recent.pluck(:account_id))
  end
end
