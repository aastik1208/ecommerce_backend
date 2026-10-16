class AddReshareCaption < ActiveRecord::Migration[6.1]
  def change
  	add_column :app_posts, :reshare_caption, :text
  end
end
