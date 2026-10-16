class AddAccountIdInItem < ActiveRecord::Migration[6.1]
  def change
  	add_column :app_items, :account_id, :bigint
  	add_column :app_items, :parent_id, :bigint
  	add_column :app_items, :reshare_caption, :text
  	add_index :app_items, :account_id
  end
end
