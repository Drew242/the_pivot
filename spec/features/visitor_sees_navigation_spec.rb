require "rails_helper"

RSpec.feature "VisitorSeesNavigation", type: :feature do
  context "as a visitor" do

    it "I see the navbar at the root path" do
      visit root_path

      expect(page).to have_content("Technically Employed")
      expect(page).to have_content("Jobs")
      expect(page).to have_content("Favorite Jobs")
      expect(page).to have_content("Create Account")
      expect(page).to have_content("Login")
      expect(page).to have_content("Employers")
    end

    it "when I click Emplyers I see an emplyer landing page" do
      visit root_path

      click_link("Employers")
      expect(current_path).to eq(company_admin_new_path)
    end

  end
end
