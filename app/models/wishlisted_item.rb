class WishlistedItem < ApplicationRecord
  self.table_name = 'app_wishlisted_items'

  validates :wishlist_id, :item_id, presence: true
   validate :validate_item, on: :create

  belongs_to :wishlist
  belongs_to :item
  belongs_to :account

  def validate_item
    if self.account.wishlisted_items.pluck(:item_id).include?(self.item_id)
      errors.add(:base, I18n.t('wishlist.item_already'))
    end
  end

end
