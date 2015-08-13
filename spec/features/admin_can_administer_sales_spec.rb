require "rails_helper"

RSpec.feature "Admin Can Administer Sales", type: :feature do
  let!(:item1) { Item.create(title: "Hat", description: "head", price: 50) }
  let!(:item2) { Item.create(title: "Shoes", description: "feet", price: 100) }
  let!(:admin) { User.create(username: "admin", password: "password", role: 1) }

  before do
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
  end

  it "can create a new sale" do
    visit admin_dashboard_path
    click_link "Create a Sale"

    expect(current_path).to eq(new_admin_sale_path)
    fill_in "Name", with: "Summer Blowout"
    fill_in "Percentage Off", with: "50"
    select "Shoes"
    select "Hat"
    click_button "Create Sale"

    expect(current_path).to eq(admin_sales_path)
    expect(page).to have_content "Summer Blowout"
    expect(page).to have_content "50%"
  end

  xit "can end a sale" do
    visit admin_dashboard_path
    click_link "Create a Sale"

    expect(current_path).to eq(new_admin_sale_path)
    fill_in "Name", with: "Summer Blowout"
    fill_in "Percentage Off", with: "50"
    select "Shoes"
    select "Hat"
    click_button "Create Sale"
    expect(page).to have_content "Summer Blowout"

    click_button "End Sale"
    expect(page).not_to have_content "Summer Blowout"
  end
end
