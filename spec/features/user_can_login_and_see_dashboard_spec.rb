require 'rails_helper'

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

#
# As a visitor
# When I visit "/"
# Then I should see a link for "Login"
# And when I click link "Create Account"
# Then my current page should be "/dashboard"
# And I should see a message in the navbar that says "Logged in as SOME_USER"
# And I should see my profile information
# And I should not see a link for "Login"
# And I should see a link for "Logout"
#
# When I click "Logout"
# Then I should see see "Login"
# And I should not see "Logout"
