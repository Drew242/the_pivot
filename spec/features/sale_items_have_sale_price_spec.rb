require "rails_helper"

RSpec.feature "Items on sale have a sale price", type: :feature do
  let!(:item1) { Item.create!(title: "Hat", description: "head", price: 100) }
  let!(:item2) { Item.create!(title: "Shoes", description: "feet", price: 25) }
  let!(:sale) { Sale.create!(name: "Summer Blowout", discount: 50, items: [item1]) }

  it "shows the sale price for an item" do
    visit items_path
    expect(page).to have_content("$50.00")
  end
end
