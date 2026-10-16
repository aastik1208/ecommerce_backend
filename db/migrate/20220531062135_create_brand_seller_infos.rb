class CreateBrandSellerInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :brand_seller_infos do |t|
      t.references :item
      t.string :seller_id
      t.string :name
      t.string :img_url
      t.timestamps
    end
  end
end
