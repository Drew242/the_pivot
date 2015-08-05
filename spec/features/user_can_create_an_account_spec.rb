require "rails_helper"
RSpec.feature "UserCanCreateAccountAndSeeDashBoard", type: :feature do
  context "when user does not exist" do

    it "can see a login when not logged in" do
      visit root_path
      expect(page).to have_content("Login")
    end

    it "can can create account" do
      visit root_path
      click_link "Create Account"

      fill_in "Username", with: "Mitchell"
      fill_in "Password", with: "password"

      click_button "Create Account"

      expect(page).to have_content("Welcome back Mitchell")
      expect(page).to have_content("We appreciate your business! - Jurassic Parka senior staff")
    end
  end
end
