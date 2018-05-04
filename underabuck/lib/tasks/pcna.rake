namespace :pcna do
  task sellable: :environment do
    ap PromoStandards::ApiBase.new(
      id: Settings.promostandards.pcna.id,
      password: Settings.promostandards.pcna.password,
      wsdl_path: Settings.promostandards.pcna.products.wsdl,
      ws_version: Settings.promostandards.pcna.products.version
    ).call(
      function: Settings.promostandards.pcna.products.function
    ).body[:get_product_sellable_response][:product_sellable_array][:product_sellable][0..2]
  end
end
