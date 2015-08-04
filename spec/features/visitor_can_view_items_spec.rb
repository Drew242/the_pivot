require "rails_helper"

RSpec.feature "VisitorCanViewItems", type: :feature do
  context "as a visitor" do
    let!(:item) do
      Item.create(title: "Parka",
                  description: "Stay warm in the tundra",
                  price: 3000,
                  image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
    end
    
    it "can view all existing items" do
      visit items_path

      expect(page).to have_content("All Items")
      expect(page).to have_content("Parka")
      expect(page).to have_content("Stay warm in the tundra")
      expect(page).to have_content("$3000")
      expect(page).to have_css("img[src*='https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg']")
    end
  end
end
