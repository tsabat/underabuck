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
    Struct.new(:body).new(
      get_available_charges_response: {
        available_charge_array: {
          available_charge: available_charges_result
        }
      }
    )
  end

  it 'saves data' do
    allow_any_instance_of(PromoStandards::ApiClient).to receive(:call) { body }
    vendor = fb.create(:vendor)
    service.new.call(vendor: vendor, product_id: 'fake')
    expect(AvailableCharge.count).to eq(2)
  end
end
