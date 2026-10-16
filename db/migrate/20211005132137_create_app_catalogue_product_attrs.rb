class CreateAppCatalogueProductAttrs < ActiveRecord::Migration[6.1]
  def change
    create_table :app_catalogue_product_attrs do |t|
      t.references :customer
      t.integer :product_id
      t.integer :views_count, default: 0
      t.integer :carts_count, default: 0
      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
