class AddPasswordHashToAppAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :social_login_token, :string
  end
end
