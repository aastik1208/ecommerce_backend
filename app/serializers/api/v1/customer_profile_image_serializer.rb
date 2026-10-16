module Api
  module V1
    class CustomerProfileImageSerializer < BaseSerializer
      attributes :id, :profile_img, :profile_img_small

      def profile_img
        ActiveStorage::Current.host = Rails.application.credentials.host
        object.profile_img.service_url  if object.profile_img.attached?
      end

      def profile_img_small
        ActiveStorage::Current.host = Rails.application.credentials.host
        object.profile_img.variant(resize: '200x200').processed.service_url  if object.profile_img.attached?
      end

    end
  end
end
