require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = User.create!(username: "mitch", password: "password", role: 0)
  end

  it "has many items" do
    # user = User.create!(username: "mitch", password: "password", role: 0)
    @user.orders << Order.create!
    expect(Order.first.items).to eq([])
  end

  it "has many order items" do
  end

  xit "has a total" do
    user = User.create!(username: "mitch", password: "password", role: 0)

    user.orders << Order.create!
  end
end
