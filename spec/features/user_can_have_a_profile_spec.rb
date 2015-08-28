require "rails_helper"
RSpec.feature "Registered User", type: :feature do
  context "that is logged in" do
    let!(:user) { User.create!(username: 'Ricky', password: 'password' )}

    it "can update their profile" do
      visit login_path
      fill_in "Username", with: "Ricky"
      fill_in "Password", with: "password"

      click_button "Login"
      within('#profile') { click_link "View Profile" }

      expect(current_path).to eq(user_path(user))

      click_button "Edit Profile"

      fill_in "Name", with: "Ricky"

      click_button "Update Account"

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Ricky")
    end
  end
end
