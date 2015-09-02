require "rails_helper"

RSpec.feature "Store Admin", type: :feature do
  include LoginHelper

  before do
    create_roles
  end

  it "can login" do
    create_account
    login_as_store_admin

    expect(page).to have_content("Company Information")
  end

  it "shows a 404 with nonregistered user" do

    visit companies_admin_companies_path(1)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it "shows a 404 with registered user non admin" do
    create_account
    login_as_registered_user

    visit companies_admin_companies_path(1)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end


