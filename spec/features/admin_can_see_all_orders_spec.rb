require "rails_helper"

RSpec.feature "AdminCanViewAllOrders", type: :feature do
  let!(:user1) { User.create(username: "marla", password: "password", role: 0) }
  let!(:user2) { User.create(username: "richard", password: "password", role: 0) }
  let!(:admin) { User.create(username: "admin", password: "password", role: 1) }
  let!(:item1) do
    Item.create(title: "Parka",
                description: "Stay warm in the tundra",
                price: 3000,
                image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
  end
  let!(:item2) do
    Item.create(title: "specs",
                description: "i see you",
                price: 100,
                image: "http://nobacks.com/wp-content/uploads/2014/11/Glasses-51-500x331.png")
  end
  let!(:order1) { Order.create(user_id: user1.id, status: 0) }
  let!(:order2) { Order.create(user_id: user2.id, status: 0) }
  let!(:order_item1) { OrderItem.create(quantity: 2, item_id: item1.id, order_id: order1.id) }
  let!(:order_item2) { OrderItem.create(quantity: 3, item_id: item2.id, order_id: order1.id) }
  let!(:order_item3) { OrderItem.create(quantity: 1, item_id: item1.id, order_id: order2.id) }
  let!(:order_item4) { OrderItem.create(quantity: 1, item_id: item2.id, order_id: order2.id) }

  context "logged in as an admin and viewing orders dashboard" do
    before do
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
    end

    it "views all orders for all users" do
      visit admin_dashboard_path
      click_link "View Orders"

      expect(current_path).to eq(admin_orders_path)
      expect(page).to have_content("All Orders")
      expect(page).to have_content("Status")
      expect(page).to have_link("View Order")
      within ("#status_summary") do
        expect(page).to have_content("Status: Ordered Count: 2")
      end
    end
  end
end
