require "rails_helper"
RSpec.feature "UserMustLoginToCheckout", type: :feature do
  context "when logged out" do
    before do
      @job = Job.create!(title: "dev", description: "awesome")
    end

    it "redirects the user to a login page if they are not logged in" do
      visit job_path(@job)
      click_button "Add to Favorites"
      visit cart_path

      expect(page).to have_content("dev")

      click_button "Apply to Jobs"

      expect(current_path).to eq(login_path)
    end
  end
end
