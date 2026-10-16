class AddIndexOnItem < ActiveRecord::Migration[6.1]
  def change
  	add_index :app_items, [:content_id, :content_type]
  end
end
