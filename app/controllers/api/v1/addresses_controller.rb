module Api
  module V1
    class AddressesController  < BaseController

      before_action :load_address, only: [:show, :update, :destroy]

      def index
        @addresses = current_customer.addresses.order('updated_at DESC')
        render json: @addresses,
                each_serializer: AddressSerializer,
                adapter: :json
      end

      def show
        render_success(Api::V1::AddressSerializer.new(@address))
      end

      def create
         address = current_customer.addresses.new(address_params)
        if address.save
          render_success(Api::V1::AddressSerializer.new(address))
        else
          render_error({ errors: address.errors.full_messages } )
        end
      end

      def update
        if @address.update(address_params)
          render_success(Api::V1::AddressSerializer.new(@address))
        else
          render_error({ errors: @address.errors.full_messages } )
        end
      end

      def destroy
        if @address.delete
          render_success({message: "#{I18n.t('customer.address.destroy')}" })
        else
          render_error({ errors: @address.errors } )
        end
      end

      def country_list
        service = Brandsday::CustomerService.new.country_listing(oauth_token: current_customer.oauth_token)
        render_success({country_list: service}, "")
      end

      private

      def load_address
        @address = current_customer.addresses.where(id: params[:id]).last
        render_error({message: "#{I18n.t('customer.address.not_found')}"}) and return unless @address.present?
      end

      def address_params
        params.require(:address).permit(:fullname, :street, :city,
                                        :state, :pincode, :country,
                                        :mobile_number, :permanent,
                                        :defaultShipping, :defaultBilling,
                                        :region, :country_id, :postcode,
                                        :firstname, :lastname, :company
                                        )
      end
    end
  end
end
