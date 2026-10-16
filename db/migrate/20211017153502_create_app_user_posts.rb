class CreateAppUserPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :app_user_posts do |t|
      t.references :customer
      t.references :parent
      t.boolean :is_shared, default: false
      t.string :post_type

      t.timestamps
    end
  end
end