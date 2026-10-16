class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :content_type
      t.integer :content_id

      t.timestamps
    end
  end
end
