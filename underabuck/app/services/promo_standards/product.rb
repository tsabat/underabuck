module PromoStandards
  class Product
    include ApiMixin
    def call(vendor:, product_id:, part_id:)
      @product_id = product_id
      @part_id = part_id

      @vendor = vendor
      store_results
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
      call_api.body[:get_product_response][:product]
    end

    def store_results
      new_product(api_objects).save!
    end

    def new_product(result_hash)
      result_hash = result_hash.with_indifferent_access
      product_marketing = result_hash[:product_marketing_point_array][:product_marketing_point]
      product_category = result_hash[:product_category_array][:product_category]
      product_part = result_hash[:product_part_array][:product_part]
      color = product_part[:color].to_json
      dimension = product_part[:dimension].to_json
      shipping = product_part[:shipping_package_array][:shipping_package]

      ::Product.new(
        product_id: result_hash[:product_id],
        product_name: result_hash[:product_name],
        description: result_hash[:description],
        product_marketing: product_marketing.to_json,
        product_brand: result_hash[:product_brand],
        export: result_hash[:export],
        product_category: product_category[:category],
        product_sub_category: product_category[:sub_category],
        part_id: product_part[:part_id],
        color: color,
        primary_material: product_part[:primary_material],
        dimension: dimension,
        is_rush_service: result_hash[:is_rush_service],
        shipping: shipping.to_json,
        is_closeout: product_part[:is_closeout],
        is_on_demand: product_part[:is_on_demand],
        is_hasmat: product_part[:is_hasmat],
        last_change_date: result_hash[:last_change_date],
        creation_date: result_hash[:creation_date],
        line_name: result_hash[:line_name]
      )
    end
  end
end
