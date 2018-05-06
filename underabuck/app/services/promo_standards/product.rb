module PromoStandards
  class Product
    def call(vendor:, product_id:, part_id: nil)
      @product_id = product_id
      @part_id = part_id

      @vendor = vendor
      call_api
    end

    private

    def call_api
      vendor_name = @vendor.name
      @api_results = PromoStandards::ApiBase.new(
        id: Settings.promostandards[vendor_name].id,
        password: Settings.promostandards[vendor_name].password,
        wsdl_path: Settings.promostandards[vendor_name].product.wsdl,
        ws_version: Settings.promostandards[vendor_name].product.version,
        args: { log: true }
      ).call(
        function: Settings.promostandards[vendor_name].product.function,
        message_args: message_args
      )
    end

    def message_args
      {
        'productId' => @product_id,
        'localizationCountry' => 'US',
        'localizationLanguage' => 'EN'
      }.merge!(
        (@part_id && { 'partId' => @part_id } || {})
      )
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
