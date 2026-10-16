class CreateAppReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :app_reviews do |t|
      t.references :customer
      t.references :relatable, polymorphic: true
      t.text :comment

      t.timestamps
    end
  end
end
