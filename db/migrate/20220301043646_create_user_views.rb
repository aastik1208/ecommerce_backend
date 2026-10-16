class CreateUserViews < ActiveRecord::Migration[6.1]
  def change
    create_table :user_views do |t|
      t.string :resource_type, null: false
      t.bigint :resource_id, null: false
      t.bigint :account_id, null: false
      t.string :url
      t.timestamps
    end
    add_index :user_views, [:resource_type, :resource_id]
  end

end
