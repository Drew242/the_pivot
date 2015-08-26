require "rails_helper"

RSpec.describe Category, type: :model do
  context "with valid attributes" do
    let!(:category) { Category.create(name: "junior developer") }

    it "has a name" do
      expect(category.name).to eq("junior developer")
    end

    it "creates a slug" do
      expect(category.slug).to eq("junior_developer")
    end

    it "has many jobs" do
      expect(category.jobs).to eq([])
    end
  end
end
