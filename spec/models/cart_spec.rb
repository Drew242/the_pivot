require "rails_helper"

RSpec.describe Cart, type: :model do
  it "exists" do
    expect(Cart).to be
  end

  context "#items" do
    it "returns an array of CartItems" do
      item = Item.create(title: "Item 2",
                         description: "Description 2",
                         price: 40,
                         image: "image url")
      data = Hash.new(0)
      data[item.id] = 2
      cart = Cart.new(data)

      expect(cart.items.first).to be_a_kind_of(CartItem)
    end
  end

  context "cart total" do
    let(:item1) do
      Item.create(title: "Item 1",
                         description: "Description 1",
                         price: 60,
                         image: "image url")
    end

    let(:item2) do
      Item.create(title: "Item 2",
                         description: "Description 2",
                         price: 40,
                         image: "image url")
    end

    let(:cart) { Cart.new(item1.id => 1, item2.id => 2) }

    it "calculates a cart total" do
      expect(cart.total).to eq(140)
    end
  end
end
