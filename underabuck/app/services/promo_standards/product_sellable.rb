module PromoStandards
  class ProductSellable
    def import(vendor:)
      @vendor = vendor

      store_results
    end

    def initial_import(vendor:)
      @vendor = vendor
      check_if_any_sellables_exist

      store_results
    end

    private

    def check_if_any_sellables_exist
      return if Sellable.count.zero?
      raise(ArgumentError, "You already have sellables for #{@vendor.name}.")
    end

    def call_api
      vendor_name = @vendor.name
      @api_results = PromoStandards::ApiBase.new(
        id: Settings.promostandards[vendor_name].id,
        password: Settings.promostandards[vendor_name].password,
        wsdl_path: Settings.promostandards[vendor_name].products.wsdl,
        ws_version: Settings.promostandards[vendor_name].products.version
      ).call(
        function: Settings.promostandards[vendor_name].products.function
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

    def import_id
      @import_id ||= Sellable.where(vendor_id: @vendor.id).maximum(:import_id).to_i + 1
    end

    def store_results
      results = api_objects.each_with_object([]) do |result, obj|
        obj << Sellable.new(
          vendor_id: @vendor.id,
          product_id: result[:product_id],
          part_id: result[:part_id],
          import_id: import_id
        )
      end
      Sellable.import(results)
    end
  end
end
