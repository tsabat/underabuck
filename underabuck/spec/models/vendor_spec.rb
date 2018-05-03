require 'rails_helper'

RSpec.describe Vendor, type: :model do
  it 'is cool' do
    Vendor.new(id: 1).save!
    ap Vendor.all
  end
end
