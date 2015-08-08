require "rails_helper"
RSpec.feature "AdminCanCreateItem", type: :feature do
  context "when user is admin" do

    it "can see a login when not logged in" do
      visit root_path
      expect(page).to have_content("Login")
    end

    it "sees creating item" do
      admin = User.create(username: "admin",
                          password: "password",
                          role: 1)
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_dashboard_path

      expect(page).to have_content("Admin Dashboard")
      expect(current_path).to eq("/admin/dashboard")
      expect(page).to have_content("Create Item")
    end
  end
end
