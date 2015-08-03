require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'with valid attributes' do
    let!(:item) { Item.create(title: "Parka",
                              description: "Stay warm in the tundra",
                              price: 3000,
                              image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg") }
    it 'has a title' do
      expect(item.title).to eq("Parka")
    end

    it 'has a description' do
      expect(item.description).to eq("Stay warm in the tundra")
    end

    it 'has a price' do
      expect(item.price).to eq(3000)
    end
  end
end
