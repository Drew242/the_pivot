require "rails_helper"

RSpec.feature "SearchBarSearchesForJobs", type: :feature do
  context "as a visitor" do
    let!(:company) do
      Company.create(name: "Crash Keys",
                     information: "An organization dedicated to the betterment of the world.")
    end
    let!(:job) do
      company.jobs << Job.create(title: "Stop the Virus",
                                 description: "One of our computer systems has become infected.",
                                 location: "Seattle, WA")
    end

    it "can search for a job given criteria" do
      visit root_path
      fill_in "exampleInputName2", with: "Stop the Virus"
      fill_in "exampleInputEmail2", with: "Seattle, WA"
      click_button "Find Me A Job"
      save_and_open_page

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Stop the Virus")
      expect(page).to have_content("Crash Keys")
      expect(page).to have_content("Seattle, WA")
    end
  end
end
