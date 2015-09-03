require "rails_helper"

RSpec.feature "Store Admin", type: :feature do
  let!(:user) { User.create!(username: 'user', password: 'password') }

  before do
    visit login_path
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"
  end

  it "can set the job status to inactive" do
    Role.create(name: "registered_user")
    Role.create(name: "company_admin")

    click_link 'Post Jobs'

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

    click_link 'Create Job'

    expect(current_path).to eq(new_companies_admin_job_path)

    fill_in "Title", with: "admin"
    fill_in "Description", with: "admin description"
    fill_in "Location", with: "Denver"

    click_button "Submit"

    expect(page).to have_content('dev')
    expect(page).to have_content('admin')
    expect(page).to have_button('active')
    expect(page).to have_button('active')

    within("#dev") { click_link_or_button "active" }

    expect(page).to have_button('inactive')

    click_link "View Jobs"

    expect(page).to_not have_content('dev')
    expect(page).to have_content('admin')

    click_link "View Jobs"
    click_link "acme"

    expect(page).to_not have_content('dev')
    expect(page).to have_content('admin')
  end
end
