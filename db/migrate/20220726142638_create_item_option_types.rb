class CreateItemOptionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :item_option_types do |t|
      t.integer :item_id, null: false
      t.references :option_type, null: false, foreign_key: true
      t.references :option_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end
