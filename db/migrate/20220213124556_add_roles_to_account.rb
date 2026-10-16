class AddRolesToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :app_accounts, :role, :integer
  end
end
