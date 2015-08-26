require "rails_helper"

RSpec.feature "User", type: :feature do
  context "as a guest" do
    let!(:job) { Job.create!(title: "Jr Dev",
                             description: "As a Junior dev, you will code",
                             location: "Denver, CO") }

    it 'can add a job to favorites' do
      visit job_path(job)

      click_button 'Add to Favorites'

      expect(page).to have_content('Added to Favorites')
    end
  end
end
