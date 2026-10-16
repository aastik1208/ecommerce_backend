class Reaction < ApplicationRecord
  self.table_name = 'app_reactions'
  
  belongs_to :resource, polymorphic: true
  belongs_to :account

   validates :account_id, :uniqueness => { :scope => [:resource_type, :resource_id] }
end
