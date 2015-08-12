require "rails_helper"
RSpec.feature "UserCanCreateAddress", type: :feature do
  let!(:user) { User.create(username: "Mitchell", password: "password") }

  it "can can create an address" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit new_user_address_path(user)
    expect(current_path).to eq(new_user_address_path(user))
    fill_in 'address[street_address]', with: "1510 Blake"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: "80218"

    click_button "Use Address"

    expect(user.address.city).to eq("Denver")
  end

end
