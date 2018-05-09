module PromoStandards
  class AvailableCharges
    include ApiMixin
    def call(vendor:, product_id:)
      @product_id = product_id
      @vendor = vendor

      store_results
    end

    private

    def api_args
      {
        'productId' => @product_id,
        'localizationCountry' => 'US',
        'localizationLanguage' => 'EN'
      }
    end

    def api_name
      'available_charges'
    end

    def api_objects
      call_api.body[
        :get_available_charges_response
      ][
        :available_charge_array
      ][
        :available_charge
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
