class ChangeTableNameWithPrifixApp < ActiveRecord::Migration[6.1]
  def change
    rename_table :wishlisted_items, :app_wishlisted_items
  end
end
