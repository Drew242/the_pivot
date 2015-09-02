require "rails_helper"

RSpec.feature "Job History", type: :feature do
  context "when logged in" do

  let!(:company) { Company.create!(name: "ZEXIS",
                                   information: "We save dimensions.") }

  let!(:job) { company.jobs.create!(title: "Brasta Test Pilot",
                                    description: "Test our prototype anti-DAMon robot.") }
  let!(:user) { User.create!(username: "vx-master",
                             password: "tenmilliondebt")}

    it "should be empty with no applications" do
      visit applications_path

      expect(page).not_to have_content("ZEXIS")
      expect(page).not_to have_content("Brasta Test Pilot")
    end
  end
end
