class CreateAppWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :app_wishlists do |t|
      t.references :account
      t.timestamps
    end
  end
end
