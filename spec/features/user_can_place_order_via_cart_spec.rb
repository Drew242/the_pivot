require "rails_helper"

RSpec.feature "UserCanPlaceOrderViaCart", type: :feature do
  context "logged in and cart has no items" do
    let!(:user) { User.create(username: "Mitchell", password: "password") }
    let!(:address) { Address.create(street_address: "1510 Blake Street", city: "Denver", state: "CO", zip: "80218", user_id: user.id) }

    it "does not see a checkout button" do
      visit cart_path
      expect(page).not_to have_content "Checkout"
    end
  end

  context "logged in and cart has items" do
    let!(:user) { User.create(username: "dorrance", password: "password") }
    let!(:address) { Address.create(street_address: "1510 Blake Street", city: "Denver", state: "CO", zip: "80218", user_id: user.id) }
    it "can click checkout and create an order" do
      @item = Item.create!(title: "TRex Specs",
                           description: "Make sure you can see what you're about to eat!",
                           price: 200,
                           image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")

      visit root_path
      click_link "Login"
      fill_in "Username", with: "dorrance"
      fill_in "Password", with: "password"
      click_button "Login"

      visit item_path(@item)
      click_button "Add to cart"
      visit item_path(@item)
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
  end
end
