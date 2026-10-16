class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :app_followers do |t|
      t.bigint :account_id
      t.bigint :follower_id

      t.timestamps
    end
  end
end
