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
    visit root_path
    click_link "Create Account"

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Email", with: "test@example.com"

    click_button "Create Account"
  end

  def login_as_registered_user
    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"

    click_button "Login"
  end

  def login_as_store_admin
    login_as_registered_user

    click_link 'Post Jobs'

    fill_in 'Name', with: 'acme'
    fill_in 'Information', with: 'acme info'

    click_button 'Create Account'
  end
end
