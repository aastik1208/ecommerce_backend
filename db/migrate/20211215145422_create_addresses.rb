class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :fullname
      t.string :street
      t.string :city
      t.string :state
      t.string :pincode
      t.string :country
      t.string :mobile_number
      t.bigint :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
