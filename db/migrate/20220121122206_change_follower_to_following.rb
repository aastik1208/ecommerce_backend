class ChangeFollowerToFollowing < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :app_followers, :follower_id, :follow_id
  end

  def self.down
    rename_column :app_followers, :follow_id, :follower_id
  end
  
end
