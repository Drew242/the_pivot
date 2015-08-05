require "rails_helper"

RSpec.feature "UserCanLoginAndSeeDashBoard", type: :feature do
  context "when logged out" do
    let!(:user) { User.create(username: "Mitchell", password: "password") }

    it "can see a login when not logged in" do
      visit root_path
      expect(page).to have_content("Login")
    end

    it "can log in" do
      visit root_path
      click_link "Login"

      fill_in "Username", with: "Mitchell"
      fill_in "Password", with: "password"

      click_button "Login"

      expect(page).to have_content("Welcome back Mitchell")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
      expect(current_path).to eq("/dashboard")
    end
  end
end
