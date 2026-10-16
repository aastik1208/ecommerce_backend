class ChangeDefaultSellerInfluncerValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :app_accounts, :is_seller, from: nil, to: false
    change_column_default :app_accounts, :is_influencer, from: nil, to: false
  end
end
