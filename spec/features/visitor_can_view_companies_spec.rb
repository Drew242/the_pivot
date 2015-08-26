require "rails_helper"

RSpec.feature "VisitorCanViewCompanies", type: :feature do
  context "as a visitor" do
    let!(:company) do
      Company.create(name: "ABC Company",
                     information: "Founded in 1999, that's how we party")
    end

    it "can view all companies" do
      visit companies_path

      expect(page).to have_content("ABC Company")
      expect(page).to have_content("Founded in 1999, that's how we party")
    end

    it "can view all existing companies" do
      visit companies_path

      expect(current_path).to eq(companies_path)
    end
  end
end
