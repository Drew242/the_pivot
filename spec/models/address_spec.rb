require 'rails_helper'

RSpec.describe Address, type: :model do
  it "creates an add with valid params" do
    address = Address.create(valid_params)
    expect(address).to be_valid
  end

  it "will not create an address without valid params" do
    address = Address.create(street_address: "1510 Blake")
    expect(address).to_not be_valid
  end

  it "belongs to a user" do
    address = Address.create(valid_params)
    expect(address.user).to eq(nil)
  end

  private

  def valid_params
    { street_address: "1510 Blake St", state: "CO", city: "Denver", zip: "80218" }
  end
end
