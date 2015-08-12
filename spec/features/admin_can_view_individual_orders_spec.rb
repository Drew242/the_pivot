require "rails_helper"

RSpec.feature "AdminCanViewAnInvididualOrder", type: :feature do
  let!(:item) do
    Item.create(title: "Parka",
    description: "Stay warm in the tundra",
    price: 3000,
    image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
  end
  let!(:admin) { User.create(username: "admin", password: "password", role: 1) }
  let!(:user) {User.create(username: "Mitch", password: "supersecret", role: 0)}
  let!(:address) {Address.create(street_address: "1510 Blake Street", city: "Denver", state: "CO", zip: "80218", user_id: user.id)}
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
      expect(page).to have_content("Customer: Mitch")
      expect(page).to have_content("Shipping Address: 1510 Blake Street, Denver CO 80218")
      within("#admin_order_items") do
        expect(page).to have_content("Parka")
        expect(page).to have_content("Quantity: 2")
        expect(page).to have_content("Price: $3,000.00")
        expect(page).to have_content("Subtotal: $6,000.00")
      end
      expect(page).to have_content("Total: $6,000.00")
    end
  end
end
