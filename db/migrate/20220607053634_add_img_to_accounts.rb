class AddImgToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :profile_img, :string
  end
end
