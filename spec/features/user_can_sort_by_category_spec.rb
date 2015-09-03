require "rails_helper"

RSpec.feature "User", type: :feature do
  include LoginHelper

  before do
    Category.create!(name: "tests")

    create_roles
    login_as_registered_user
  end

  it "can sort jobs by category" do

    click_link "Jobs"

    expect(page).to have_content('Filter by Category')

    find(".caret").click

    expect(page).to have_content('Tests')

    find(".tests").click

    expect(page).to have_css('.tests')
  end
end
