class Magento::ProductEntityText < ActiveRecord::Base
  self.table_name = 'catalog_product_entity_text'

  AttributeMap = {
    '85' => 'Title',
    '76' => 'Long Description',
    '75' => 'Short Description',
  }

  scope :descriptions, -> { where(attribute_id: AttributeMap.keys) }

  def parsed_description
    result = {}
    result[AttributeMap[attribute_id.to_s]] = value
    result
  end
end