describe PromoStandards::FobPoints do
  let(:service) { PromoStandards::FobPoints }
  let(:fob_points_result) do
    {
      fob_id: '33013',
      fob_city: 'Hialeah',
      fob_state: 'FL',
      fob_postal_code: '33013',
      fob_country: 'USA',
      currency_supported_array: {
        currency_supported: [
          {
            currency: 'CAD',
          },
          {
            currency: 'USD'
          }
        ]
      },
      product_array: {
        product: {
          product_id: 'HL-104',
        },
      },
    }
  end

  let(:fob_points_result_array) do
    result2 = fob_points_result
    # let's make the id++
    id = result2[:fob_id].to_i
    result2[:fob_id] = id
    [
      fob_points_result,
      result2
    ]
  end

  def body(as_array:)
    Struct.new(:body).new(
      get_fob_points_response: {
        fob_point_array: {
          fob_point: as_array ? fob_points_result_array : fob_points_result
        }
      }
    )
  end

  it 'saves one fob point' do
    allow_any_instance_of(PromoStandards::ApiClient).to receive(:call) { body(as_array: false) }
    service.new.call(vendor: fb.create(:vendor), product_id: 'fake')
    expect(FobPoint.count).to eq(1)
    expect(FobPoint.last.currency_supported).to eq('CAD,USD')
  end

  # the results sound plural, but when a singular comes back, it is a hash, not an array
  it 'saves one many fob points' do
    allow_any_instance_of(PromoStandards::ApiClient).to receive(:call) { body(as_array: true) }
    service.new.call(vendor: fb.create(:vendor), product_id: 'fake')
    expect(FobPoint.count).to eq(2)
  end
end
