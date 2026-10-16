module CartHelper

  def post_process_cart(data)
    return data unless data['items'].present?
    
    wishlisted_items_ids = current_account.wishlisted_items.collect(&:item_id)
    item_skus = Magento::Product.includes(:item).where(item: {id: wishlisted_items_ids}).collect(&:sku)
    data['items'].each do |item|
      if item_skus.include? item['sku']
        item.merge!(is_wishlisted: true)
      else
        item.merge!(is_wishlisted: false)
      end
    end
    data
  end

end