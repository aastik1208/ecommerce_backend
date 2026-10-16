class RemoveColumnFromAccount < ActiveRecord::Migration[6.1]
  def change
    remove_column :brand_seller_infos, :name, :string
    remove_column :brand_seller_infos, :img_url, :string
    remove_column :app_accounts, :profile_img, :string
  end
end
