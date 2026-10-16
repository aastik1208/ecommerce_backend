class Brandsday::SellerJob < ApplicationJob
  queue_as :default

  def perform
    magento_sellers = Magento::MarketplaceUserdata.all
    magento_seller_ids = magento_sellers.pluck(:seller_id)
    own_seller_ids = Seller.pluck(:magento_id).map(&:to_i)
    new_seller_ids = magento_seller_ids - own_seller_ids
    new_sellers = magento_sellers.where(seller_id: new_seller_ids)
    new_sellers_entity = new_sellers.map do |seller|
      new_seller = Seller.new(type: "Seller", email: fetch_email(seller), magento_id: seller.seller_id, is_seller: seller.is_seller?, created_at: DateTime.now, updated_at: DateTime.now, magento_updated_at: seller.updated_at)
      if seller.save
        p "new seller created: email: #{new_seller.email}"
      else
        p new_seller.errors.full_messages.join(', ')
      end
    end
    magento_sellers.each do |seller|
      seller_account = Seller.where(magento_id: seller.seller_id).last
      next if seller_account.nil? || seller_account.magento_updated_at == seller.updated_at

      seller_account.update({type: "Seller", email: fetch_email(seller), magento_id: seller.seller_id, is_seller: seller.is_seller?, magento_updated_at: seller.updated_at })
    end
  end


  private

  def fetch_email(seller)
    customer_entity = Magento::CustomerEntity.where(entity_id: seller.seller_id).last
    customer_entity&.email.to_s
  end
end
