module Api
  module V1
    class FollowSerializer < CustomerProfileSerializer
      include FollowHelper
      attributes :is_following

      def is_following
        is_follow?(object, instance_options[:scope])
      end
    end
  end
end