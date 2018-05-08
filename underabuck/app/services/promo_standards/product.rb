module PromoStandards
  class Product
    include ApiMixin
    def call(vendor:, product_id:, part_id: nil)
      @product_id = product_id
      @part_id = part_id

      @vendor = vendor
      call_api
    end

    private

    def api_args
      {
        'productId' => @product_id,
        'localizationCountry' => 'US',
        'localizationLanguage' => 'EN'
      }.merge!(
        (@part_id && { 'partId' => @part_id } || {})
      )
    end

    def api_name
      'product'
    end

    def api_objects
      call_api.body[
        :get_product_sellable_response
      ][
        :product_sellable_array
      ][
        :product_sellable
      ]
    end
  end
end
