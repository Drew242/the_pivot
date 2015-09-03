require "rails_helper"
RSpec.feature "User", type: :feature do
  let!(:company) { Company.create!(name: "acme",
                                   information: "asdf") }

  let!(:job) { company.jobs.create!(title: "Job1",
                                    description: "Job 1 description") }
  let!(:job2) { company.jobs.create!(title: "Job2",
                                     description: "Job 2 description") }

  before do
    visit company_job_path(job.company, job)
    click_button "Add to Favorites"
    visit company_job_path(job2.company, job2)
    click_button 'Add to Favorites'
  end

  context "that is logged in as a registered user"  do
    let!(:user) { User.create!(username: 'user', password: 'password') }

    before do
      visit login_path
      fill_in "Username", with: "user"
      fill_in "Password", with: "password"

      click_button "Login"
    end

    it "is redirected to the application history page when applying for jobs" do

      click_link "Favorite Jobs"
      click_button "Apply to Jobs"

      expect(current_path).to eq(applications_path)

      click_link "View"

      expect(page).to have_content('Job1')
      expect(page).to have_content('Job2')
    end

    it "can view their past applications" do

      click_link "Favorite Jobs"
      click_button "Apply to Jobs"

      click_link "View Profile"

      expect(page).to have_content('Your Previous Applications')
    end

    it "can visit the jobs show page from application history" do

      click_link "Favorite Jobs"
      click_button "Apply to Jobs"
      click_link "View"

      expect(page).to have_link('Job1')
      expect(page).to have_link('Job2')

      click_link "Job1"

      expect(page).to have_content('Job 1 description')

      click_link "View Profile"
      click_link "View"

      click_link "Job2"

      expect(page).to have_content('Job 2 description')
    end
  end
end
