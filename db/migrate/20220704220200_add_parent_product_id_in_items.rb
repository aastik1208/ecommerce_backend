class AddParentProductIdInItems < ActiveRecord::Migration[6.1]
  def change
    add_column :app_items, :parent_product_id, :bigint, index: true
  end
end
