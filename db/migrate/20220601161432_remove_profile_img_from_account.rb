class RemoveProfileImgFromAccount < ActiveRecord::Migration[6.1]
  def change
  	remove_column :app_accounts, :profile_img
  end
end
