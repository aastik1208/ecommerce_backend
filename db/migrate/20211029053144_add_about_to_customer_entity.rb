class AddAboutToCustomerEntity < ActiveRecord::Migration[6.1]
  def change
    add_column :customer_entity, :about, :text
  end
end
