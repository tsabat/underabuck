module PromoStandards
  class FobPoints
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
      'fob_points'
    end

    def api_objects
      call_api.body[
        :get_fob_points_response
      ][
        :fob_point_array
      ][
        :fob_point
      ]
    end

    def store_results
      objs = api_objects
      results = if objs.is_a?(Array)
                  objs.each_with_object([]) do |result, obj|
                    obj << new_fob_point(result)
                  end
                else
                  [new_fob_point(objs)]
                end
      FobPoint.import(results)
    end

    def new_fob_point(fob_hash)
      fob = fob_hash.slice(:fob_id, :fob_city, :fob_state, :fob_postal_code, :fob_country)
      currencies = currency_csv(fob_hash[:currency_supported_array][:currency_supported])
      fob[:currency_supported] = currencies
      FobPoint.new(fob)
    end

    def currency_csv(currency_hash)
      currency_hash.map do |currency|
        currency[:currency]
      end.join(',')
    end
  end
end
