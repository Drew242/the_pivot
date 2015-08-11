require "rails_helper"

RSpec.feature "AdminCanViewAllOrders", type: :feature do
  let!(:item) do
    Item.create(title: "Parka",
                description: "Stay warm in the tundra",
                price: 3000,
                image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
  end
  let!(:admin) { User.create(username: "admin", password: "password", role: 1) }
  let!(:user) {User.create(username: "Mitch", password: "supersecret", role: 0)}
  let!(:order) { Order.create(user_id: user.id, status: 0) }
  let!(:order_item) { OrderItem.create(quantity: 2, item_id: item.id, order_id: order.id) }
  context "logged in as an admin and viewing a single order" do

    before do
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
    end

    it "views all orders for all users" do
      visit admin_order_path(order)

      expect(page).to have_content("Order #{order.id}")
      expect(page).to have_content("Created on #{order.created_at.strftime("%b %d, %Y")} at #{order.created_at.strftime("%I:%M:%S %p")}")
      expect(page).to have_content("Customer: #{user.username}")
      # within ("#status_summary") do
      #   expect(page).to have_content("Status: Ordered Count: 2")
      # end
    end
  end
end
