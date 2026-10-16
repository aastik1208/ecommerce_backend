class AddFieldsToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :seller_phone_number, :string, comment: 'UAE format +971'
    add_column :app_accounts, :seller_web_url, :string
    add_column :app_accounts, :seller_store_address, :string
  end
end
