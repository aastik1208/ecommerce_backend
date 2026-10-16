class AddWebsite < ActiveRecord::Migration[6.1]
  def change
    add_column :customer_entity, :bio, :text
    add_column :customer_entity, :website, :string
  end
end
