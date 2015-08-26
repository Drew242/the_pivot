require "rails_helper"

RSpec.feature "VisitorSeesCompanyIdOnJobShow", type: :feature do
  context "as a visitor" do
    let!(:company) { Company.create(name: "ABC Company", information: "xyz") }
    let!(:job) do
      company.jobs.create(title: "Jr Dev",
                          description: "As a Junior developer, you will code",
                          location: "Denver, CO",
                          company_id: 1)
    end

    it "can view a single job" do
      visit jobs_path

      expect(page).to have_content("Jobs")
      click_link("Jr Dev")
      expect(current_path).to eq(company_job_path(job.company, job))
    end
  end 
end
