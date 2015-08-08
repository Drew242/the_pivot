require "rails_helper"

RSpec.feature "UserCanPlaceOrderViaCart", type: :feature do
  context "logged in and cart has no items" do
    let!(:user) { User.create(username: "Mitchell", password: "password") }

    it "does not see a checkout button" do
      visit cart_path
      expect(page).not_to have_content "Checkout"
    end
  end

  context "logged in and cart has items" do
    let!(:user) { User.create(username: "dorrance", password: "password") }

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

      #this will be scoped to that particular user
      # expect(page).to have_content "Order was successfully placed"
      # within "table" do
        # expect(page).to have_content "$400.00"
      # end
    end
  end
end

# When I am logged in
# And I visit "/cart"
# And I click "Checkout"
# Then the order should be placed
# And my current page should be "/orders"
# And I should see a message "Order was successfully placed"
# And I should see the order I just placed in a table
