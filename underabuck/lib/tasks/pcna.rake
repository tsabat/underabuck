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
    ap PromoStandards::AvailableCharges.new.call(vendor: vendor, product_id: 'HL-104')
  end
end
