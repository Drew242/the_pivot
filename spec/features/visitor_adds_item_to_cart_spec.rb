require "rails_helper"

RSpec.feature "VisitorAddsItemToCart", type: :feature do
  context "not logged in and cart is empty" do
    it "it adds an item to the cart" do
      item = Item.create(title: "TRex Specs",
                         description: "Make sure you can see what you're about to eat!",
                         price: 200,
                         image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")

      visit item_path(item)
      click_button "Add to cart"
      expect(current_path).to eq(items_path)
      visit item_path(item)
      click_button "Add to cart"

      click_link "View Cart"

      expect(page.body).to have_content("TRex Specs")
      expect(page.body).to have_content("Make sure you can see what you're about to eat!")
      expect(page.body).to have_content("$200")
      expect(page.body).to have_css("img[src*='https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg']")
      expect(page.body).to have_content("Cart Total: $400.00")
    end
  end

  context "not logged in and cart is not empty" do
    before do
      item = Item.create(title: "TRex Specs",
                         description: "Make sure you can see what you're about to eat!",
                         price: 200,
                         image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")

      visit item_path(item)
      click_button "Add to cart"
    end

    it "adds an additional item to the cart" do
      visit cart_path
      expect(page.body).to have_content("1")

      fill_in "Quantity", with: "2"
      click_button "Update Quantity"

      expect(current_path).to eq(cart_path)
      expect(page.body).to have_content("2")
      #test subtotal
      expect(page.body).to have_content("Cart Total: $400.00")
      # When I visit "/cart"
      # Then I should see my item with a quantity of 1
      # And when I increase the quantity
      # Then my current page should be '/cart'
      # And that item's quantity should reflect the increase
      # And the subtotal for that item should increase
      # And the total for the cart should match that increase
    end
  end
end
