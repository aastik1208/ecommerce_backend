class AddOauthToken < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :oauth_token, :string
  end
end
