class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :app_posts do |t|
      t.string :post_type
      t.references :account, null: false, foreign_key: {to_table: :app_accounts}
      t.text :content
      t.text :caption
      t.boolean :is_shared, default: true

      t.timestamps
    end
  end
end
