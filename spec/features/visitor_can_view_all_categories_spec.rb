require "rails_helper"

RSpec.feature "VisitorCanViewCategories", type: :feature do
  context "as a visitor" do
    it "can view all existing items" do
      Category.create(name: "hats")
      Category.create(name: "boots")
      Category.create(name: "shirts")

      visit items_path
      click_link("Categories")
      expect(page).to have_content("Hats")
      expect(page).to have_content("Boots")
      expect(page).to have_content("Shirts")
    end
  end
end
