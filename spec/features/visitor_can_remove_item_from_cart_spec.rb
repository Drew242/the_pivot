require "rails_helper"

RSpec.feature "VisitorRemovesItemFromCart", type: :feature do
  context "not logged in and cart has items in it" do
    before do
      item = Item.create(title: "TRex Specs",
                         description: "Make sure you can see what you're about to eat!",
                         price: 200,
                         image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")

      visit item_path(item)
      click_button "Add to cart"
      click_link "View Cart"
    end

    it "removes an item from the cart" do
      visit cart_path
      click_button "Remove"

      expect(current_path).to eq(cart_path)
      expect(flash[:notice]).to eq("Successfully removed Item 1 from your cart.")
      # test flash notice css
      # test link in flash notice
      within "#Title" do
        expect(page).not_to have_content("Item 1")
      end
    end
  end
end

# As a visitor
# When I visit "/cart"
# And I click link "Remove"
# Then my current page should be "/cart"
# And I should see a message styled in green
# And the message should say "Successfully removed SOME_ITEM from your cart."
# And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart
