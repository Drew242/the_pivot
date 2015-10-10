require "rails_helper"

RSpec.feature "User", type: :feature do
  include LoginHelper

  before do
    Category.create!(name: "tests")

    create_roles
    login_as_registered_user
  end

  it "can sort jobs by category" do

    expect(page).not_to have_content('Filter by Category')
    click_link "View Jobs"

    expect(page).to have_content('Filter by Category')
    expect(page).not_to have_content('Tests')
    find(".caret").click

    expect(page).to have_content('Tests')
  end
end
