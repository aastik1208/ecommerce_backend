class ChangeColumnInWishlistedItems < ActiveRecord::Migration[6.1]
  def up
    add_reference :wishlisted_items, :wishlist
    add_reference :wishlisted_items, :item
  end

  def down
    remove_column :wishlisted_items, :item_id, :integer
    remove_column :wishlisted_items, :account_id, :integer
    remove_column :wishlisted_items, :wishlist_id, :integer
  end

end
