require "rails_helper"

RSpec.feature "UserCanViewPastOrder", type: :feature do
  context "logged in with previous order" do
    let!(:user) { User.create(username: "dorrance", password: "password") }
    let!(:item) do Item.create(title: "TRex Specs", description: "specs",
      price: 200, image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
    end
    let!(:address) {Address.create(street_address: "1510 Blake Street", city: "Denver", state: "CO", zip: "80218", user_id: user.id)}

    it "can click checkout and create an order" do
      visit root_path
      click_link "Login"
      fill_in "Username", with: "dorrance"
      fill_in "Password", with: "password"
      click_button "Login"

      visit item_path(item)
      click_button "Add to cart"
      visit item_path(item)
      click_button "Add to cart"

      visit cart_path
      click_button "Checkout"

      expect(current_path).to eq(orders_path)
      expect(Order.all.count).to eq(1)
      expect(OrderItem.first.quantity).to eq(2)
      expect(user.orders.first.total).to eq(400)
      expect(page).to have_content "Order was successfully placed"
      within "table" do
        expect(page).to have_content "$400.00"
      end
    end

    it "can visit orders path and see orders" do
      visit root_path
      click_link "Login"
      fill_in "Username", with: "dorrance"
      fill_in "Password", with: "password"
      click_button "Login"

      visit item_path(item)
      click_button "Add to cart"
      visit item_path(item)
      click_button "Add to cart"

      visit cart_path
      click_button "Checkout"

      visit orders_path
      click_link "View Order"

      expect(page).to have_link "TRex Specs"
      expect(page).to have_content "2"
      expect(page).to have_content "$400.00"
      expect(page).to have_content "Ordered"
      expect(page).to have_content "Total: $400.00"
      expect(page).to have_content "Ordered on:"

      click_link "TRex Specs"
      expect(page).to have_content "TRex Specs Details"
    end
  end
end
