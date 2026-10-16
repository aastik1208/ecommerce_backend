class AddIsSellerToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :is_seller, :boolean
  end
end
