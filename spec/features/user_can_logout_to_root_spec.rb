require "rails_helper"
RSpec.feature "UserCanLogoutAndSeeHomePage", type: :feature do
  context "when logged in" do
    let!(:user) { User.create(username: "Mitchell", password: "password") }

    it "can see a login when not logged in" do
      visit root_path
      expect(page).to have_content("Login")
    end

    it "can log out" do
      visit root_path
      click_link "Login"

      fill_in "Username", with: "Mitchell"
      fill_in "Password", with: "password"

      click_button "Login"
      click_link "Logout"

      expect(page).to_not have_content("Logout")
      expect(page).to have_content("Login")
      expect(current_path).to eq "/"
    end
  end
end
