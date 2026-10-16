module Api
  module V1
    class ReviewSerializer < BaseSerializer
      include DateHelper, AccountHelper
      attributes :id, :relatable_id, :relatable_type, :account, :comment, :replies, :created_at, :rating, :tagged_account

      def account
        {
          id: object.account.id,
          first_name: object.account.firstname,
          lastname: object.account.lastname,
          profile_img: profile_img
        }
      end

      def profile_img
        ActiveStorage::Current.host = Rails.application.credentials.host
        object.account.profile_img.service_url if object.account.profile_img.attached?
      end

      def replies
        object.replies.map { |comment| ReviewSerializer.new(comment) }
      end

      def tagged_account
        tagged_accounts(object)
      end
    end
  end
end
