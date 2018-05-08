module PromoStandards
  class AvailableCharges
    def call(vendor:, product_id:)
      @product_id = product_id
      @vendor = vendor

      store_results
    end

    private

    def call_api
      vendor_name = @vendor.name
      @api_results = PromoStandards::ApiBase.new(
        id: Settings.promostandards[vendor_name].id,
        password: Settings.promostandards[vendor_name].password,
        wsdl_path: Settings.promostandards[vendor_name].product_pricing.wsdl,
        ws_version: Settings.promostandards[vendor_name].product_pricing.version,
        args: { log: false }
      ).call(
        function: Settings.promostandards[vendor_name].product_pricing.function,
        message_args: message_args
      )
    end

    def message_args
      {
        'productId' => @product_id,
        'localizationCountry' => 'US',
        'localizationLanguage' => 'EN'
      }
    end

    def api_objects
      call_api.body[
        :get_available_charges_response
      ][
        :available_charges_array
      ][
        :available_charges
      ]
    end

    def store_results
      results = api_objects.each_with_object([]) do |result, obj|
        obj << AvailableCharge.new(
          vendor_id: @vendor.id,
          charge_id: result[:charge_id],
          charge_name: result[:charge_name],
          charge_type: result[:charge_type]
        )
      end
      AvailableCharge.import(results)
    end
  end
end
