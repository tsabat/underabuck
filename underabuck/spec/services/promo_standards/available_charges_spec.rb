describe PromoStandards::AvailableCharges do
  let(:service) { PromoStandards::AvailableCharges }
  let(:available_charges_result) do
    [
      {
        charge_id: '12617',
        charge_name: 'SETUP SUBLIMATION',
        charge_type: 'Setup'
      },
      {
        charge_id: '12619',
        charge_name: 'RUNNING APPAREL LABEL PRINT',
        charge_type: 'Run'
      }
    ]
  end

  def body
    {
      get_available_charges_response: {
        available_charges_array: {
          available_charges: available_charges_result
        }
      }
    }
  end

  it 'saves data' do
    allow_any_instance_of(PromoStandards::AvailableCharges).to receive(:call_api) { body }
    vendor = fb.create(:vendor)
    service.new.call(vendor: vendor, product_id: 'fake')
    expect(AvailableCharge.count).to eq(2)
  end
end
