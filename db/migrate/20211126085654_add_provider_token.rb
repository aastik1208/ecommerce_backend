class AddProviderToken < ActiveRecord::Migration[6.1]
  def change
    add_column :customer_entity, :provider, :string
    add_column :customer_entity, :provider_token, :text
  end
end
