class AddIndexInFollowers < ActiveRecord::Migration[6.1]
  def change
    add_index :app_followers, :account_id
  end
end
