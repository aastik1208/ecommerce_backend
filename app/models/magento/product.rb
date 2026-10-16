class Magento::Product < ActiveRecord::Base
  self.table_name = 'catalog_product_entity'

  has_one :item, as: :content
  has_many :galleries, foreign_key: 'entity_id'
  has_many :product_entity_decimals, foreign_key: 'entity_id'
  has_many :product_super_links, foreign_key: 'parent_id'
  has_many :product_entity_texts, foreign_key: 'entity_id'

  def price
    product_entity_decimals.find_by(attribute_id: ATTRIBUTE_IDS['price']).try(:value)
  end

  def special_price
    product_entity_decimals.find_by(attribute_id: ATTRIBUTE_IDS['special_price']).try(:value)
  end

  def variants
    return [] unless type_id == 'configurable'

    variant_ids = product_super_links.collect(&:product_id)
    Magento::Product.where(entity_id: variant_ids)
  end
end
