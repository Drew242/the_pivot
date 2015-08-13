require "rails_helper"

RSpec.feature "Items on sale have a sale price", type: :feature do
  let!(:item1) { Item.create!(title: "Hat", description: "head", price: 100) }
  let!(:item2) { Item.create!(title: "Shoes", description: "feet", price: 25) }
  let!(:sale1) { Sale.create!(name: "Summer Blowout", discount: 50, items: [item1]) }
  let!(:sale2) { Sale.create!(name: "It's Over", discount: 50, items: [item2], status: 1) }

  it "shows the sale price for an item" do
    visit items_path
    expect(page).to have_content("$50.00")
  end

  it "does not show a sale price for items part of an expired sale" do
    visit items_path
    expect(page).not_to have_content ("$12.50")
  end
end
