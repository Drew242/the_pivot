require "rails_helper"

RSpec.feature "User", type: :feature do
  context "as a guest" do

    let!(:company) { Company.create!(name: "acme",
                                     information: "asdf") }

    let!(:job) { company.jobs.create!(title: "Job 1",
                                      description: "Job 1 description") }


    it 'can add a job to favorites' do
      visit company_job_path(job.company, job)

      click_button 'Add to Favorites'

      expect(page).to have_content('Added to Favorites')
    end
  end
end
