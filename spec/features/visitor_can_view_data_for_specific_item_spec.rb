require "rails_helper"

RSpec.feature "visitor can view data for specific items", type: :feature do
  context "as a visitor when I visit the show page" do
    let!(:item) do
      Item.create(title: "Brachiosaurus Scarf",
                  description: "An extra long scarf for all of those littlefoots in your life",
                  price: 230,
                  image: "img[src*='http://vignette1.wikia.nocookie.net/scarfheroes/images/e/e6/Royal-stewart-tartan-lambswool-scarf.jpg/revision/latest?cb=20150322230625']")
    end

      scenario "when a visitor is on an items show they see the items details" do
        visit item_path(item)
        within "#title" do
          expect(page).to have_content("Brachiosaurus Scarf Details")
        end

        within ".thumbnail" do
          expect(page).to have_css("img[src*='http://vignette1.wikia.nocookie.net/scarfheroes/images/e/e6/Royal-stewart-tartan-lambswool-scarf.jpg/revision/latest?cb=20150322230625']")
          expect(page).to have_content("An extra long scarf for all of those
          littlefoots in your life")
        end
        
        within ".price_and_quantity" do
          expect(page).to have_content("230")
        end
      end
    end
  end
