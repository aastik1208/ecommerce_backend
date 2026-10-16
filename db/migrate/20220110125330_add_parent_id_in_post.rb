class AddParentIdInPost < ActiveRecord::Migration[6.1]
  def change
  	add_column :app_posts, :parent_id, :bigint
  end
end
