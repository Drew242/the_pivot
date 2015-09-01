require "rails_helper"

RSpec.feature "Store Admin", type: :feature do
  let!(:user) { User.create!(username: 'user', password: 'password') }

  before do
    visit login_path
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"
  end

  it "can edit an existing job" do
    Role.create(name: "registered_user")
    Role.create(name: "company_admin")

    click_link 'Employers'

    fill_in 'Name', with: 'acme'
    fill_in 'Information', with: 'acme info'

    click_button 'Create Account'

    expect(current_path).to eq(companies_admin_company_path(user.company.id))

    click_link 'Create Job'

    expect(current_path).to eq(new_companies_admin_job_path)

    fill_in "Title", with: "dev"
    fill_in "Description", with: "dev description"
    fill_in "Location", with: "Denver"

    click_button "Submit"

    expect(current_path).to eq(companies_admin_company_path(user.company.id))

    click_link 'Edit'

    fill_in "Title", with: "edited dev"
    fill_in "Description", with: "edited dev description"
    fill_in "Location", with: "Cleveland"

    click_button "Submit"


    expect(page).to have_content('edited dev')
    expect(page).to have_content('edited dev description')
    expect(page).to have_content('Cleveland')
  end
end
