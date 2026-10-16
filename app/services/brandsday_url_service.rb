class BrandsdayUrlService

  RELATIVE_PATHS = {
    customer_signup: "/rest/V1/customers",
    customer_login: "/rest/V1/integration/customer/token",
  }


  def get(type)
    "#{PublicConstant::APP_URL}#{RELATIVE_PATHS[:type]}"
  end
end