class AddResetTokenToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :otp_code, :string
    add_column :app_accounts, :reset_password_token, :string
    add_column :app_accounts, :reset_password_sent_at, :datetime
    add_column :app_accounts, :phone_number, :string
    add_column :app_accounts, :magento_id, :string, comment: 'Magento customer id'
  end
end
