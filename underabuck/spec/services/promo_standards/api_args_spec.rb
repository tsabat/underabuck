describe PromoStandards::ApiArgs do
  let(:service) { PromoStandards::ApiArgs }
  let(:service_instance) do
    service.new(
      api_name: 'product',
      vendor_settings: Settings.promostandards['pcna'],
      api_args: { 'key' => 'value' },
      savon_client_args: { log: true }
    )
  end

  it 'has default args' do
    svc = service_instance
    expect(svc.api_args['ins0:id']).to eq('UNDERABUCK')
    expect(svc.api_args['ins0:password']).to eq('TBD')
    expect(svc.api_args['ins0:wsVersion']).to eq('1.0.0')
  end

  it 'has user-supplied args' do
    svc = service_instance
    expect(svc.api_args['ins0:key']).to eq('value')
  end

  it 'creates a wsdl path' do
    svc = service_instance
    expect(svc.savon_client_args[:wsdl]).to eq('TBD/psProductData.svc?singleWsdl')
  end

  it 'takes savon client args' do
    svc = service_instance
    expect(svc.savon_client_args[:log]).to eq(true)
  end

  it 'exposes function' do
    svc = service_instance
    expect(svc.function).to eq(:get_product)
  end
end
