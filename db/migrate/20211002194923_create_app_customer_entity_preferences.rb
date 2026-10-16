class CreateAppCustomerEntityPreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :app_customer_entity_preferences do |t|
      t.references :customer
      t.string :kind
      t.string :preference_id

      t.timestamps
    end
  end
end
