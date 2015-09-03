require "rails_helper"

RSpec.feature "User", type: :feature do
  include LoginHelper

  before do
    create_roles
  end

  context "that isn't registered" do

    it "can register" do

      visit root_path

      click_link "Create Account"

      expect(current_path).to eq(signup_path)

      fill_in "Username", with: "user"
      fill_in "Password", with: "password"
      fill_in "Email", with: "test@example.com"

      click_button "Create Account"

      expect(page).to have_content("Find A Job")
    end
  end

  context "that is registered" do
    it "can login" do
      create_account
      login_as_registered_user

      save_and_open_page
      expect(page).to have_content("Your Previous Applications")
    end

    it "can logout" do
      create_account
      login_as_registered_user

      click_link "Logout"

      expect(page).to have_content("Login")
    end
  end
end
