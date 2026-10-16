require 'open-uri'
require 'cgi'
class Brandsday::BrandInfoJob < ApplicationJob
  queue_as :default

  def perform
    uri = URI.parse("https://staging.brandsday.com/rest/V1/products/?searchCriteria[pageSize]=10000&searchCriteria[currentPage]=1")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.get(uri.request_uri)
    magento_products = JSON.parse(response.body)
    magento_products.values.flatten.each do |magento_product|
      next if !magento_product.is_a?(Hash) || magento_product["id"].nil?
      product = Item.includes(:account).product.find_by(content_id: magento_product["id"])
      next if product.nil?

      update_seller_and_associate_product(product, magento_product, {})
    end
  end

  private

  def update_seller_and_associate_product(product, magento_product, sellers_updated_in_this_run)
    seller = Account.find_or_initialize_by(magento_id: magento_product["extension_attributes"]["seller_id"], is_seller: true, type: Seller)
    ActiveRecord::Base.transaction do
      update_seller(seller, magento_product) unless sellers_updated_in_this_run[magento_product["extension_attributes"]["seller_id"]].present?
      product.update!(account: seller)
      sellers_updated_in_this_run[magento_product["extension_attributes"]["seller_id"]] = true
    end
  end

  def update_seller(seller, magento_product)
    if magento_product["extension_attributes"]["seller_id"].present?
      firstname, lastname = get_name(magento_product["extension_attributes"]["seller_id"])
      seller.firstname = firstname
      seller.lastname = lastname
      url = URI.parse(magento_product["extension_attributes"]["logo_image"])
      filename = File.basename(url.path)
      file = URI.open(url)
      seller.profile_img.attach(io: file, filename: filename)
      seller.save!
    end
  rescue OpenURI::HTTPError => e
    nil
  end

  def get_name(magento_seller_id)
    first_and_last_name = []
    seller = Magento::CustomerEntity.find_by(entity_id: magento_seller_id)
    [seller&.firstname, seller&.lastname]
  end
end
