class Wishlist < ApplicationRecord
  self.table_name = 'app_wishlists'

  belongs_to :account
  has_many :wishlisted_items, dependent: :destroy
end
