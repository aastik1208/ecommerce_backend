class AddFieldsToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :defaultShipping, :boolean, default: true
    add_column :addresses, :defaultBilling, :boolean, default: true
    add_column :addresses, :region, :string
    add_column :addresses, :country_id, :string
    add_column :addresses, :postcode, :string
    add_column :addresses, :firstname, :string
    add_column :addresses, :lastname, :string
  end
end
