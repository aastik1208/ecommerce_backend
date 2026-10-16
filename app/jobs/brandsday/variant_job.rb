class Brandsday::VariantJob < ApplicationJob
  queue_as :default

  def perform
    uri = URI.parse("https://staging.brandsday.com/rest/V1/products/?searchCriteria[pageSize]=10000&searchCriteria[currentPage]=1")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.get(uri.request_uri)
    magento_products = JSON.parse(response.body)
    magento_products['items'].each do |product|
	    next unless product["extension_attributes"]["child_products"].present?
	    
			product["extension_attributes"]["child_products"].each do |variant|
			    quantity = variant['extension_attributes']['quantity_available']
			    variant_attributes = variant['extension_attributes']['child_attributes']
			    variant_attributes.each do |attribute|
			    	next if JSON.parse(attribute).keys[0] == "category_ids"

			    	option_type = OptionType.find_or_create_by(name: JSON.parse(attribute).keys[0])
			    	option_value = OptionValue.find_or_create_by(option_type_id: option_type.id, value: JSON.parse(attribute).values[0])
			    	@item = Magento::Product.find(variant["id"]).item
			    	if @item.present?
			    		ItemOptionType.find_or_create_by(item_id: @item.id, option_type_id: option_type.id, option_value_id: option_value.id)
			    	end
			    end
			    Item.find(@item.id).update_column(:quantity, quantity)
			end
		end
  end

end
