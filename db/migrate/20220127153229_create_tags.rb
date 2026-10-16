class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :app_tags do |t|
      t.references :account, null: false, foreign_key: {to_table: :app_accounts}
      t.integer :tagable_id
      t.string :tagable_type

      t.timestamps
    end
  end
end
