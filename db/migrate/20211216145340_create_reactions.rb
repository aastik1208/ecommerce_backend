class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.references :resource, polymorphic: true, null: false
      t.references :customer, null: false
      t.string :reaction_type, default: 'like'

      t.timestamps
    end
  end
end
