class OauthToken < ApplicationRecord
  self.table_name = 'oauth_token'
  self.inheritance_column = :not_usable

  # Associations
  belongs_to :customer
end