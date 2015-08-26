require "rails_helper"

RSpec.describe Sale, type: :model do
  # it "has a name" do
  #   sale = Sale.create(name: "Summer Blowout", discount: 50)
  #   expect(sale.name).to eq("Summer Blowout")
  # end
  #
  # it "has a discount" do
  #   sale = Sale.create(name: "Summer Blowout", discount: 50)
  #   expect(sale.discount).to eq(50)
  # end
  #
  # it "has a default status of active" do
  #   sale = Sale.create!(name: "Summer Blowout", discount: 50)
  #   expect(sale.status).to eq("active")
  # end
  #
  # it "can be expired" do
  #   sale = Sale.create!(name: "Summer Blowout", discount: 50, status: 1)
  #   expect(sale.status).to eq("expired")
  # end
  #
  # it "can end a sale" do
  #   sale = Sale.create!(name: "Summer Blowout", discount: 50)
  #   sale.expire
  #   expect(sale.status).to eq("expired")
  # end
  #
  # it "does not offer a discount of more than 99%" do
  #   sale = Sale.create(name: "Summer Blowout", discount: 100)
  #   expect(sale).not_to be_valid
  # end
  #
  # it "does not offer a discount of less than 1%" do
  #   sale = Sale.create(name: "Summer Blowout", discount: 0)
  #   expect(sale).not_to be_valid
  # end
end
