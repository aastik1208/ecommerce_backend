class CustomerAddress < ApplicationRecord
  self.table_name = 'customer_address_entity'

  belongs_to :customer, foreign_key: :parent_id

  before_validation :assign_attrs

  private

  def assign_attrs
    self.firstname = customer.firstname
    self.lastname = customer.lastname
    self.city = ""
    self.street = ""
  end
end
