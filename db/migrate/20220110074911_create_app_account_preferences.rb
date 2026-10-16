class CreateAppAccountPreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :app_account_preferences do |t|
      t.integer :magento_category_id
      t.integer :level
      t.references :account
      t.timestamps
    end
  end
end
