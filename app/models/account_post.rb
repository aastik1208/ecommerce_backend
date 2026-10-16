class AccountPost < ApplicationRecord
  self.table_name = 'app_account_posts'
  
  belongs_to :account
  belongs_to :post
end
