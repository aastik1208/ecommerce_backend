class CreateAccountPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :app_account_posts do |t|
      t.references :account, null: false, foreign_key: {to_table: :app_accounts}
      t.references :post, null: false, foreign_key: {to_table: :app_posts}

      t.timestamps
    end
  end
end
