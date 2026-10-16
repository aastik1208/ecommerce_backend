class ChangeCustomerIdToAccountIdInReaction < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :app_reactions, :customer_id, :account_id
  end

  def self.down
    rename_column :app_reactions, :account_id, :customer_id
  end
end
