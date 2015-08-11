require "rails_helper"
RSpec.feature "AdminCanCreateItem", type: :feature do
  context "when user is admin" do

    it "can see a login when not logged in" do
      visit root_path
      expect(page).to have_content("Login")
    end

    it "sees updating item" do
      admin = User.create(username: "admin",
                          password: "password",
                          role: 1)
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_dashboard_path

      expect(page).to have_content("Admin Dashboard")
      expect(current_path).to eq("/admin/dashboard")
      expect(page).to have_content("View all Items")

      click_link("View all Items")
      expect(current_path).to eq("/admin/items")
    end 
  end
end
