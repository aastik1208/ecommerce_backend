class AddInfluencerToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :is_influencer, :boolean
  end
end
