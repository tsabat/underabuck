namespace :pcna do
  task sellable: :environment do
    vendor = Vendor.new(name: 'pcna')
    api_result = PromoStandards::ProductSellable.new.initial_import(vendor: vendor)
  end

  task product_and_part: :environment do
    vendor = Vendor.new(name: 'pcna')
    rslt = PromoStandards::Product.new.call(vendor: vendor, product_id: 'HL-104', part_id: 'HL-104GR')
  end

  task product: :environment do
    vendor = Vendor.new(name: 'pcna')
    rslt = PromoStandards::Product.new.call(vendor: vendor, product_id: 'HL-104')
    IO.write(Rails.root + 'tmp/product.json', JSON.pretty_generate(rslt))
  end

  task available_charges: :environment do
    vendor = Vendor.new(name: 'pcna')
    rslt = PromoStandards::AvailableCharges.new.call(vendor: vendor, product_id: 'HL-104')
    # IO.write('/tmp/rslt', rslt)
    ap rslt
  end

  task fob_points: :environment do
    vendor = Vendor.new(name: 'pcna')
    rslt = PromoStandards::FobPoints.new.call(vendor: vendor, product_id: 'HL-104')
    ap rslt
  end

  task configuration_and_pricing: :environment do
    vendor = Vendor.new(name: 'pcna')
    rslt = PromoStandards::ConfigurationAndPricing.new.call(
      vendor: vendor,
      product_id: 'HL-104',
      fob_id: '33013',
      part_id: 'HL-104BK',
      configuration_type: 'Decorated'
    )
    IO.write(Rails.root + 'tmp/configuration_and_pricing.json', JSON.pretty_generate(rslt.body))
  end
end
