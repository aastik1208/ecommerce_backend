module Api
  module V1
    class AddressSerializer < BaseSerializer
      attributes :id, :firstname, :lastname, :street, :city, :state, :pincode, :country, :mobile_number, :region,  :country_id, :defaultShipping, :defaultBilling, :company
    end
  end
end
