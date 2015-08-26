require "rails_helper"

RSpec.feature "VisitorCanViewJobs", type: :feature do
  context "as a visitor" do
    let!(:company) { Company.create(name: "ABC Company", information: "xyz") }
    let!(:job) do
      company.jobs.create(title: "Jr Dev",
                          description: "As a Junior developer, you will code",
                          location: "Denver, CO",
                          company_id: 1)
    end

    it "can view all existing jobs" do
      visit jobs_path

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Jr Dev")
      expect(page).to have_content("Denver, CO")
    end

    it "can view all existing jobs" do
      visit jobs_path

      expect(current_path).to eq(jobs_path)
    end
  end
end
