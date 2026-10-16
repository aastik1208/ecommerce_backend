class Magento::Gallery < ActiveRecord::Base
  self.table_name = 'catalog_product_entity_varchar'
  belongs_to :product, foreign_key: 'entity_id'
end
