module Api
  module V1
    class BaseSerializer < ActiveModel::Serializer
      def formatted_datetime(date)
        date.try(:strftime, "%d-%m-%Y %H:%M")
      end

      def formatted_time(time)
        time.try(:strftime, "%H:%M")
      end

      def formatted_date(time)
        time.try(:strftime, "%d-%m-%Y")
      end
    end
  end
end
