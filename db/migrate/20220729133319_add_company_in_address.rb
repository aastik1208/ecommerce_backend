class AddCompanyInAddress < ActiveRecord::Migration[6.1]
  def change
  	add_column :addresses, :company, :text
  end
end
