require 'rails_helper'

RSpec.feature "VisitorCanViewItemsAtCategoriesPath", type: :feature do
  context 'as a visitor' do
    let!(:category) {Category.create(name: "hats")}
    let!(:item) { Item.create(category_id: category.id, title: "Sombraro",
                              description: "Hola",
                              price: 3000,
                              image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg") }
    let!(:item2) { Item.create(category_id: category.id, title: "Cowboy",
                              description: "Yee-haw",
                              price: 3000,
                              image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg") }
    let!(:item3) { Item.create(category_id: 0, title: "Boots",
                              description: "There's a snake in my boot!",
                              price: 3000,
                              image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg") }

    it 'can view all items for its category' do
      visit category_path(category)

      expect(page).to have_content("Hats")
      expect(page).to have_content("Sombraro")
      expect(page).to have_content("Cowboy")
    end
  end
end
