class AddItemIdInPost < ActiveRecord::Migration[6.1]
  def change
    add_column :app_posts, :item_id, :integer
  end
end
