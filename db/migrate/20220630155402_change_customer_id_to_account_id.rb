class ChangeCustomerIdToAccountId < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :app_reviews, :customer_id, :account_id
  end

  def self.down
    rename_column :app_reviews, :account_id, :customer_id
  end
end
