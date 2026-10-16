class AddDefaultAddressToAddresses < ActiveRecord::Migration[6.1]
  def change
     add_column :addresses, :permanent, :boolean, default: false
  end
end
