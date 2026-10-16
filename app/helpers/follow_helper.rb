module FollowHelper

  def is_follow? user, current_account
    if user.present? && current_account.present?
      return true if Follower.where(follow_id: user.id, account_id: current_account.id).present?
      return false
    else
      false
    end
  end
end
