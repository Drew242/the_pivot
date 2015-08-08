require "rails_helper"

RSpec.feature "VisitorRemovesItemFromCart", type: :feature do
  context "not logged in and cart has one item in it" do
    before do
      item = Item.create(title: "TRex Specs",
                         description: "Make sure you can see what you're about to eat!",
                         price: 200,
                         image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")

      visit item_path(item)
      click_button "Add to cart"
    end

    it "removes an item from the cart" do
      visit cart_path
      click_button "Remove"

      expect(current_path).to eq(cart_path)
      expect(page).to have_content("Successfully removed TRex Specs from your cart.")
      expect(page).not_to have_content("$200.00")
    end

    it "can click on a link to get back to the item it removed from the cart" do
      visit cart_path
      click_button "Remove"
      click_link "TRex Specs"

      expect(page).to have_content("Make sure you can see what you're about to eat!")
    end
  end

  context "not logged in and cart has multiple items in it" do
    before do
      item = Item.create(title: "TRex Specs",
                         description: "Make sure you can see what you're about to eat!",
                         price: 200,
                         image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")

      visit item_path(item)
      click_button "Add to cart"
      visit item_path(item)
      click_button "Add to cart"
    end

    it "decreases the quantity of items in the cart" do
      visit cart_path
      click_button "-"

      expect(current_path).to eq(cart_path)
      expect(page.body).to have_content("1")
    end
  end
end
