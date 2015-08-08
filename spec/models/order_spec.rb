require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = User.create!(username: "mitch", password: "password", role: 0)
    @item = Item.create!(title: "dinosaur", description: "aksdhk", price: 3)
  end

  xit "has many items" do
    @user.orders << order.save
    expect(Order.first.items).to eq([])
  end

  it "has many order items" do
  end

  xit "has a total" do
    user = User.create!(username: "mitch", password: "password", role: 0)

    user.orders << Order.create!
  end
end
