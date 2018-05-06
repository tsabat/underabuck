describe PromoStandards::ProductSellable do        
  let(:service) { PromoStandards::ProductSellable }
  let(:product_sellable_result) do
    [
      {
        product_id: 'HL-104',
        part_id: 'HL-104BK'
      },
      {
        product_id: 'HL-104',
        part_id: 'HL-104BL'
      }
    ]
  end

  def body
    Struct.new(:body).new(
      get_product_sellable_response: {
        product_sellable_array: {
          product_sellable: product_sellable_result
        }
      }
    )
  end

  describe 'initial import' do
    it 'stores data' do
      allow_any_instance_of(PromoStandards::ProductSellable).to receive(:call_api) { body }
      vendor = fb.create(:vendor)
      service.new.initial_import(vendor: vendor)
      expect(Sellable.count).to eq(2)
      expect(Sellable.last.import_id).to eq(1)
    end

    it 'fails if non-empty table' do
      allow_any_instance_of(PromoStandards::ProductSellable).to receive(:call_api) { body }
      fb.create(:sellable)
      vendor = fb.create(:vendor)

      expect do
        service.new.initial_import(vendor: vendor)
      end.to raise_error(
        ArgumentError, /You already have sellables for pcna/
      )
    end
  end

  describe 'import' do
    it 'stores data' do
      allow_any_instance_of(PromoStandards::ProductSellable).to receive(:call_api) { body }
      vendor = fb.create(:vendor)
      # an import that happened in the past
      fb.create(:sellable, vendor_id: vendor.id, import_id: 1)

      # our new import
      service.new.import(vendor: vendor)

      # we inserted 2, with one already there
      expect(Sellable.count).to eq(3)

      # this is counted as the second import_id
      expect(Sellable.last.import_id).to eq(2)
    end
  end
end
