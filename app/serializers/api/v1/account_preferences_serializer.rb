module Api
  module V1
    class AccountPreferencesSerializer < BaseSerializer
      attributes :details

      def details
        all_details
      end

      def all_details
        detail = []
        object.each do |obj|
            detail << { id: obj[0], name: obj[1], level: obj[2], parent_id: obj[3] }
        end
        return detail
      end
    end
  end
end
