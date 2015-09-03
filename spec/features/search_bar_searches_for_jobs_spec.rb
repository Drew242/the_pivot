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
    let!(:bad_job) do
      company.jobs << Job.create(title: "Prevent Radical-6",
                                 description: "Please infiltrate the Mars Mission Test Site.",
                                 location: "Reno, NV")
    end
    let!(:same_title) do
      company.jobs << Job.create(title: "Stop the Virus",
                                 description: "One of our computer systems has become infected.",
                                 location: "Philadelphia, PA")
    end
    let!(:same_location) do
      company.jobs << Job.create(title: "AI Coordinator",
                                 description: "Monitor our developing AI. Requires quantum computing experience.",
                                 location: "Seattle, WA")
    end

    it "can search for a job given criteria" do
      visit root_path
      fill_in :search_title, with: "Stop the Virus"
      fill_in :search_location, with: "Seattle, WA"
      click_button "Find A Job"

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Stop the Virus")
      expect(page).to have_content("Crash Keys")
      expect(page).to have_content("Seattle, WA")
    end

    it "searches using the intersection" do
      visit root_path
      fill_in :search_title, with: "Stop the Virus"
      fill_in :search_location, with: "Seattle, WA"
      click_button "Find A Job"

      expect(page).not_to have_content("Philadelphia, PA")
      expect(page).not_to have_content("AI Coordinator")
    end

    it "can search for a job given only a title" do
      visit root_path
      fill_in :search_title, with: "Stop the Virus"
      click_button "Find A Job"

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Stop the Virus")
      expect(page).not_to have_content("Prevent Radical-6")
    end

    it "can search for a job given only a location" do
      visit root_path
      fill_in :search_location, with: "Seattle, WA"
      click_button "Find A Job"

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Stop the Virus")
      expect(page).not_to have_content("Prevent Radical-6")
    end

    it "does not return jobs not matching the criteria" do
      visit root_path
      fill_in :search_title, with: "Stop the Virus"
      fill_in :search_location, with: "Seattle, WA"
      click_button "Find A Job"

      expect(page).to have_content("Jobs")
      expect(page).not_to have_content("Prevent Radical-6")
      expect(page).not_to have_content("Reno, NV")
    end

    it "will return results based on an inexact match" do
      visit root_path
      fill_in :search_title, with: "Virus"
      fill_in :search_location, with: "Seattle"
      click_button "Find A Job"

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Stop the Virus")
      expect(page).to have_content("Crash Keys")
      expect(page).to have_content("Seattle, WA")
    end

    it "will return results based on an inexact title only" do
      visit root_path
      fill_in :search_title, with: "Virus"
      click_button "Find A Job"

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Stop the Virus")
      expect(page).to have_content("Crash Keys")
      expect(page).to have_content("Seattle, WA")
    end

    it "will return results based on an inexact location only" do
      visit root_path
      fill_in :search_location, with: "Seattle"
      click_button "Find A Job"

      expect(page).to have_content("Jobs")
      expect(page).to have_content("Stop the Virus")
      expect(page).to have_content("Crash Keys")
      expect(page).to have_content("Seattle, WA")
    end
  end
end
