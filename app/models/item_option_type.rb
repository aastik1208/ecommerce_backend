class ItemOptionType < ApplicationRecord
  belongs_to :item
  belongs_to :option_type
  belongs_to :option_value
end
