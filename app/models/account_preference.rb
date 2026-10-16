class AccountPreference < ApplicationRecord
  self.table_name = 'app_account_preferences'

  # Associations
  belongs_to :account

  validates :magento_category_id, presence: true

end
