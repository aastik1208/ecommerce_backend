class Tag < ApplicationRecord
  self.table_name = 'app_tags'

  belongs_to :account
  belongs_to :tagable, polymorphic: true

end
