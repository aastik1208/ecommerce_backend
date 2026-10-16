class AddFieldToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :magento_updated_at, :datetime
  end
end
