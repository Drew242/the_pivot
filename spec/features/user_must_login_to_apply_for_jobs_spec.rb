require "rails_helper"
RSpec.feature "UserMustLoginToCheckout", type: :feature do
  context "when logged out" do

  let!(:company) { Company.create!(name: "acme",
                                   information: "asdf") }

  let!(:job) { company.jobs.create!(title: "dev",
                                    description: "Job 1 description") }

    it "redirects the user to a login page if they are not logged in" do
      visit company_job_path(job.company, job)

      click_button "Add to Favorites"

      visit cart_path

      expect(page).to have_content("dev")

      click_button "Apply to Jobs"

      expect(current_path).to eq(login_path)
    end
  end
end
