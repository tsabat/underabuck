namespace :pcna do
  task sellable: :environment do
    vendor = Vendor.new(name: 'pcna')
    api_result = PromoStandards::ProductSellable.new.initial_import(vendor: vendor)
  end

  task product: :environment do
    vendor = Vendor.new(name: 'pcna')
    ap PromoStandards::Product.new.call(vendor: vendor, product_id: 'HL-104', part_id: 'HL-104GR')
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
end
