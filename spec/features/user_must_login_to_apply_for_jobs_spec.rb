require "rails_helper"
RSpec.feature "User", type: :feature do
  context "when logged out" do

  let!(:company) { Company.create!(name: "acme",
                                   information: "asdf") }

  let!(:job) { company.jobs.create!(title: "Job 1",
                                    description: "Job 1 description") }
  let!(:job2) { company.jobs.create!(title: "Job 2",
                                     description: "Job 2 description") }

    it "is redirected to a login page" do
      visit company_job_path(job.company, job)
      click_button "Add to Favorites"
      visit company_job_path(job2.company, job2)
      click_button 'Add to Favorites'

      visit cart_path

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')

      click_button "Apply to Jobs"

      expect(current_path).to eq(login_path)
    end
  end
end
