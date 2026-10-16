class DropBrandSellerInfoTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :brand_seller_infos
  end

  def down
    create_table :brand_seller_infos do |t|
      t.references :item
      t.string :seller_id
      t.string :name
      t.string :img_url
      t.timestamps
    end
  end
end
