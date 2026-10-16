class AddQuantityInItem < ActiveRecord::Migration[6.1]
  def change
  	add_column :app_items, :quantity, :float, default: 0
  end
end
