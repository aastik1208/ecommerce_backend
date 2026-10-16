module WishlistHelper
  def is_wishlisted? account
    return false unless account.present?
    account.wishlisted_items.pluck(:item_id).include?(object.id)
  end
end
