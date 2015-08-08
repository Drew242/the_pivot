require "rails_helper"
RSpec.describe Item, type: :model do
  context "with attributes" do
    it "can be created" do
      item = Item.new(title: "Parka",
                      description: "Stay warm in the tundra",
                      price: 3000,
                      image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
      item.save
      expect(item).to be
    end

    it "has attributes as assigned" do
      item = Item.new(title: "Parka",
                      description: "Stay warm in the tundra",
                      price: 3000,
                      image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
      item.save
      expect(item.price).to eq(3000)
    end
  end
end
