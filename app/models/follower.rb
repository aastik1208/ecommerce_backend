class Follower < ApplicationRecord
  self.table_name = 'app_followers'

  belongs_to :account
  validate :validate_follower, on: :create

  def validate_follower
    if account_id == follow_id
      errors.add(:base, I18n.t('follower.same_account'))
    elsif Follower.find_by(account_id: account_id, follow_id: follow_id).present?
      errors.add(:base, I18n.t('follower.already_exist'))
    end
  end
end
