require "rails_helper"
RSpec.feature "User", type: :feature do
  let!(:company) { Company.create!(name: "acme",
                                   information: "asdf") }

  let!(:job) { company.jobs.create!(title: "Job 1",
                                    description: "Job 1 description") }
  let!(:job2) { company.jobs.create!(title: "Job 2",
                                     description: "Job 2 description") }

  before do
    visit company_job_path(job.company, job)
    click_button "Add to Favorites"
    visit company_job_path(job2.company, job2)
    click_button 'Add to Favorites'
  end

  context "that is logged in as a registerd user"  do
    let!(:user) { User.create!(username: 'user', password: 'password') }

    before do
      visit login_path
      fill_in "Username", with: "user"
      fill_in "Password", with: "password"

      click_button "Login"
    end

    it "can view their application history" do

      click_link "Favorite Jobs"
      click_button "Apply to Jobs"

      expect(current_path).to eq(applications_path)

      click_link "View Application History"

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')
    end

    it "can visit the jobs show page from application history" do

      click_link "Favorite Jobs"
      click_button "Apply to Jobs"
      click_link "View Application History"

      expect(page).to have_link('Job 1')
      expect(page).to have_link('Job 2')

      click_link "Job 1"

      expect(page).to have_content('Job 1 description')

      click_link "View Profile"
      click_link "View Past Applications"
      click_link "View Application History"

      click_link "job 2"

      expect(page).to have_content('Job 2 description')
    end
  end
end
