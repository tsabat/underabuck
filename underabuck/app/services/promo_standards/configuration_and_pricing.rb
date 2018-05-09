module PromoStandards
  class ConfigurationAndPricing
    include ApiMixin

    def call(vendor:, product_id:, fob_id:, configuration_type:, part_id: nil)
      @vendor = vendor
      @product_id = product_id
      @fob_id = fob_id
      @configuration_type = configuration_type
      @part_id = part_id

      store_results
    end

    def api_args
      args = {
        'productId' => @product_id,
        'fobId' => @fob_id,
        'configurationType' => @configuration_type,
        'localizationCountry' => 'US',
        'localizationLanguage' => 'EN',
        'currency' => 'USD',
        'priceType' => 'Net'
      }
      return args unless @part_id

      args['partId'] = @part_id
      args
    end

    def api_name
      'configuration_and_pricing'
    end

    def api_objects
      call_api.body[
        :get_configuration_and_pricing_response
      ][
        :fob_point_array
      ][
        :fob_point
      ]
    end

    def store_results
      call_api
    end
  end
end
