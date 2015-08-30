require "rails_helper"

RSpec.feature "User", type: :feature do

  let!(:user) { User.create!(username: 'user', password: 'password') }

  before do
    visit login_path
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"
  end

  context "that is logged in" do

    it "can upload a resume" do
      click_button "Edit Profile"
      click_button "Upload File"

    end
  end
end
