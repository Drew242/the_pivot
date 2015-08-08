require "rails_helper"
RSpec.feature "UserMustLoginToCheckout", type: :feature do
  context "when logged out" do
    before do
      @item = Item.create(title: "hat", description: "a nice hat", price: 3000)
    end

    it "redirects the user to a login page if they are not logged in" do
      visit item_path(@item)
      click_button "Add to cart"
      visit cart_path

      expect(page).to have_content("hat")
      
      click_button "Checkout"

      expect(current_path).to eq(login_path)
    end
  end
end
