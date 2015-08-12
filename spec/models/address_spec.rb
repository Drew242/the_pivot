require 'rails_helper'

RSpec.describe Address, type: :model do
  context "with valid params" do
    let!(:address) { Address.create(valid_params) }

    it "creates an address with valid params" do
      expect(address).to be_valid
    end

    it "belongs to a user" do
      expect(address.user).to eq(nil)
    end

    it "has a street address" do
      expect(address.street_address).to eq("1510 Blake St")
    end

    it "has a state" do
      expect(address.state).to eq("CO")
    end

    it "has a city" do
      expect(address.city).to eq("Denver")
    end

    it "has a zip" do
      expect(address.zip).to eq("80218")
    end
  end

  context "with invalid params" do
    it "will not create an address without valid params" do
      address = Address.create(street_address: "1510 Blake")
      expect(address).to_not be_valid
    end
  end

  private

  def valid_params
    { street_address: "1510 Blake St", state: "CO", city: "Denver", zip: "80218" }
  end
end
