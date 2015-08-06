require "rails_helper"
RSpec.feature "AdminCanSeeDashBoard", type: :feature do
  context "as an admin" do
    it "logs in and sees dashboard" do
      admin = User.create(username: "admin",
                          password: "password",
                          role: 1)
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_dashboard_path

      expect(page).to have_content("Admin Dashboard")
      expect(current_path).to eq("/admin/dashboard")
    end

    it "shows a 404 with registered user non admin" do
      User.create(username: "nonadmin", password: "meh")
      visit admin_dashboard_path

      expect(page).to have_content(
      'The page you were looking for doesn"t exist.'
      )
    end

    it "shows a 404 with nonregistered user" do
      visit admin_dashboard_path

      expect(page).to have_content(
      'The page you were looking for doesn"t exist.'
      )
    end
  end
end
