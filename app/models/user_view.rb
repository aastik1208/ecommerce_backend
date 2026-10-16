class UserView < ApplicationRecord
    belongs_to :resource, polymorphic: true
    belongs_to :account

    scope :recent, lambda{ where(['created_at > ?', 30.days.ago]) }
end
