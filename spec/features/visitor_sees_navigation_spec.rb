require "rails_helper"

RSpec.feature "Visitor", type: :feature do
  include LoginHelper

  context "that visits our welcome page" do

    it "will see the navbar" do
      visit root_path

      expect(page).to have_content("Technically Employed")
      expect(page).to have_content("Jobs")
      expect(page).to have_content("Favorite Jobs")
      expect(page).to have_content("Create Account")
      expect(page).to have_content("Login")
      expect(page).to have_content("Employers")
    end

    it "will have to register to create a company" do
      create_roles

      visit root_path

      click_link("Employers")

      expect(current_path).to eq(login_path)

      click_link "Register"

      fill_in "Username", with: "user"
      fill_in "Password", with: "password"

      click_button "Create Account"

      expect(current_path).to eq(root_path)

      click_link "Employers"

      expect(current_path).to eq(new_company_path)
    end
  end
end
