require "rails_helper"

RSpec.feature "User", type: :feature do

  context "as a guest" do

    let!(:company) { Company.create!(name: "acme",
                                     information: "asdf") }

    let!(:job) { company.jobs.create!(title: "Job 1",
                                      description: "Job 1 description") }
    let!(:job2) { company.jobs.create!(title: "Job 2",
                                       description: "Job 2 description") }


    it 'can add a job to favorites' do
      visit company_job_path(job.company, job)

      click_button 'Add to Favorites'

      expect(page).to have_content('Added to Favorites')
    end


    it 'can see a list of their favorite jobs' do
      visit company_job_path(job.company, job)
      click_button 'Add to Favorites'
      visit company_job_path(job2.company, job2)
      click_button 'Add to Favorites'

      visit cart_path

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')
    end

    it "is redirected page to login/register if they 'Apply to Jobs'" do
      visit company_job_path(job.company, job)
      click_button "Add to Favorites"
      visit company_job_path(job2.company, job2)
      click_button 'Add to Favorites'

      visit cart_path

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')

      click_button "Apply to Jobs"

      expect(current_path).to eq(login_path)

      click_link "Register"

      expect(current_path).to eq(signup_path)
    end

    it "can login and their favrorite jobs will persist" do
      @user = User.create!(username: "ricky", password: "password", role: 0)

      visit company_job_path(job.company, job)
      click_button "Add to Favorites"
      visit company_job_path(job2.company, job2)
      click_button 'Add to Favorites'

      visit cart_path

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')

      click_button "Apply to Jobs"

      expect(current_path).to eq(login_path)

      fill_in "Username", with: 'ricky'
      fill_in "Password", with: 'password'

      click_button "Login"

      within('#favorite_jobs') { click_link "Favorite Jobs" }

      expect(page).to have_content('Job 1')
      expect(page).to have_content('Job 2')
    end
  end
end
