require 'rails_helper'

RSpec.describe Sale, type: :model do

  it "has a name" do
    sale = Sale.create(name: "Summer Blowout", discount: 50)
    expect(sale.name).to eq("Summer Blowout")
  end

  it "has a discount" do
    sale = Sale.create(name: "Summer Blowout", discount: 50)
    expect(sale.discount).to eq(50)
  end

  it "does not offer a discount of more than 99%" do
    sale = Sale.create(name: "Summer Blowout", discount: 100)
    expect(sale).not_to be_valid
  end

  it "does not offer a discount of less than 1%" do
    sale = Sale.create(name: "Summer Blowout", discount: 0)
    expect(sale).not_to be_valid
  end
end
