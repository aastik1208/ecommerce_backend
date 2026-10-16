class Address < ApplicationRecord

  belongs_to :addressable, polymorphic: true
  validates :mobile_number, presence: true

  validate :create_on_magento,  on: :create
  validate :create_on_magento,  on: :update

  before_create :validate_single_active_address
  before_update :validate_single_active_address

  private

  def validate_single_active_address
    all_address_ids = Address.where(addressable_id: self.addressable.id, addressable_type: "Account").pluck(:id) - [self.id]
    Address.where(id: all_address_ids).update_all(defaultShipping:false) if self.defaultShipping.present?
    Address.where(id: all_address_ids).update_all(defaultBilling: false) if self.defaultBilling.present?
    Address.where(id: all_address_ids).update_all(defaultBilling: false, defaultShipping:false) if (self.defaultBilling.present? && self.defaultShipping.present?)
  end

  def create_on_magento
    result = Brandsday::CustomerService.new.create_address(address_params)
    errors.add(:base, result[:message]) if result[:message].present?
  end

  def update_on_magento
    result = Brandsday::CustomerService.new.update_address(update_address_data)
    errors.add(:base, result[:message]) if result[:message].present?
  end

  def address_params
    {
    customer_id: self.addressable.magento_id,
    oauth_token: self.addressable.oauth_token,
    defaultShipping: self.defaultShipping,
    defaultBilling: self.defaultBilling,
    region: self.region,
    country_id: self.country_id,
    street: ["#{self.street}"],
    postcode: self.pincode,
    city: self.city,
    firstname: self.firstname,
    lastname: self.lastname,
    telephone: self.mobile_number,
    countryId: self.country_id
    }
  end

  def update_address_data
      {
        customer:
        {
          email: self.addressable.email,
          firstname: self.firstname,
          lastname: self.lastname,
          website_id: 1,
            addresses: [
                {
                  customer_id: self.addressable.magento_id,
                  region: {region_code: "",region: "",region_id: 0},
                  region_id: self.region,
                  country_id: self.country,
                  street: ["#{self.street}"],
                  company: "Prashant",
                  telephone: self.mobile_number,
                  fax: "00000000000000",
                  postcode: self.pincode,
                  city: self.city,
                  firstname: self.firstname,
                  lastname: self.lastname,
                  default_shipping: self.defaultShipping
                },
               {
                  customer_id: self.addressable.magento_id,
                  region: {region_code: "",region: "",region_id: 0},
                  region_id: self.region,
                  country_id: self.country,
                  street: ["#{self.street}"],
                  company: "Prashant",
                  telephone: self.mobile_number,
                  fax: "00000000000000",
                  postcode: self.pincode,
                  city: self.city,
                  firstname: self.firstname,
                  lastname: self.lastname,
                  default_billing: self.defaultBilling
              }
            ]
        },
        oauth_token: self.addressable.oauth_token
      }
  end
end
