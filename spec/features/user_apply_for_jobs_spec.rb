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


  context "that isn't logged in" do

    it "is redirected to a login page if they apply for jobs" do

      click_link "Favorite Jobs"

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')

      click_button "Apply to Jobs"

      expect(current_path).to eq(login_path)
    end
  end

  context "that is logged in as a registered user"  do
    let!(:user) { User.create!(username: 'user', password: 'password') }

    before do
      visit login_path
      fill_in "Username", with: "user"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Email", with: "user@example.com"

      click_button "Login"
    end

    it "receives confirmation that they have successfully applied for jobs" do

      click_link "Favorite Jobs"

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')

      click_button "Apply to Jobs"

      expect(current_path).to eq(applications_path)
      expect(page).to have_content('Your applications have been successfully sent')
    end
  end
end
