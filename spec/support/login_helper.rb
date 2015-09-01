require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

module LoginHelper

  def create_roles
    Role.create(name: "registered_user")
    Role.create(name: "company_admin")
    Role.create(name: "platform_admin")
  end

  def create_account
    visit signup_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Create Account"
  end

  def login_as_registered_user
    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"
  end
end
