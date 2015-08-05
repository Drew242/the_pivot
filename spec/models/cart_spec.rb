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
end
