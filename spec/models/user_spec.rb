require 'rails_helper'

RSpec.describe User, type: :model do

  it "creates a user with valid params" do
    user = User.create(valid_params)
    expect(user).to be_valid
  end

  it "will not create a user without valid params" do
    user = User.create({username: "Drew"})
    expect(user).to_not be_valid
  end

  it "has a unique username" do
    User.create(valid_params)
    user = User.create(valid_params)
    expect(user).to_not be_valid 
  end

  private

  def valid_params
    {username: "Drew", password: "password"}
  end

end
