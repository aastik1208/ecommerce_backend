class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :app_accounts do |t|
      t.string :email, comment: "Email", unique: true
      t.string :profile_img, comment: "profile picture"
      t.string :firstname, comment: "First Name"
      t.string :middlename, comment: "Middle Name/Initial"
      t.string :lastname, comment: "Last Name"
      t.text   :description
      t.string :city
      t.datetime :birthday
      t.string :gender
      t.string :interest
      t.string :provider
      t.text :provider_token
      t.string :type, null: false
      t.string :jwt_token

      t.index :email, name: "CUSTOMER_EMAIL_ID"
      t.index :firstname, name: "CUSTOMER_ENTITY_FIRSTNAME"
      t.index :lastname, name: "CUSTOMER_ENTITY_LASTNAME"
      t.timestamps
    end
  end
end
