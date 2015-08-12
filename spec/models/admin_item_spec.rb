require "rails_helper"
RSpec.describe Item, type: :model do
  context "with all attributes" do
    let!(:item) do
      Item.create!(title: "Parka",
                   description: "Stay warm in the tundra",
                   price: 3000,
                   image: "https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
    end

    it "can be created" do
      expect(item).to be
    end

    it "has a title" do
      expect(item.title).to eq("Parka")
    end

    it "has a description" do
      expect(item.description).to eq("Stay warm in the tundra")
    end

    it "has a price" do
      expect(item.price).to eq(3000)
    end

    it "has an image" do
      expect(item.image).to eq("https://s-media-cache-ak0.pinimg.com/236x/90/eb/32/90eb32bc73e010067b15e08cac3ff016.jpg")
    end
  end

  context "without an image" do
    let!(:item) do
      Item.create!(title: "Parka",
                   description: "Stay warm in the tundra",
                   price: 3000)
    end

    it "has a default image" do
      expect(item.image).to eq("https://www.big-lies.org/NUKE-LIES/profile.ak.fbcdn.net/hprofile-ak-snc4/50335_2236820400_8469_n.jpg")
    end
  end
end
