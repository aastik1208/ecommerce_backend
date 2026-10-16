module Api
  module V1
    class ReactionSerializer < BaseSerializer
      include DateHelper
      attributes :id, :account, :reaction_type, :created_at

      def account
        {
          id: object.account.id,
          first_name: object.account.firstname
        }
      end
    end
  end
end
