class CreateWishlistedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlisted_items do |t|
      t.integer :account_id
      t.integer :item_id
      t.timestamps
    end
  end
end
