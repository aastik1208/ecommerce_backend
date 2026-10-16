class Brandsday::ProductJob < ApplicationJob
  queue_as :default

  def perform
    product_ids = Magento::Product.pluck(:entity_id)
    item_associated_product_ids = Item.product.pluck(:content_id)
    new_product_ids = product_ids - item_associated_product_ids
    deleted_product_ids = item_associated_product_ids - product_ids
    if new_product_ids.present?
      new_ids = []
      new_product_ids.each do |id|
        new_ids.push({content_id: id, content_type: "Magento::Product", created_at: DateTime.now, updated_at: DateTime.now})
      end
      Item.insert_all(new_ids)
    end
    Item.where(content_id: deleted_product_ids).destroy_all
  end

  private
end
