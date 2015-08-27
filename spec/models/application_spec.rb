require 'rails_helper'

RSpec.describe Application, type: :model do
  before do
    @user = User.create!(username: "mitch", password: "password", role: 0)
    company = Company.create!(name: "acme", information: "asdf")
    @job = company.jobs.create!(title: "junior_developer", description: "wicked")
    @application = Application.create!(user_id: @user.id, status: 0)
    @job_application = JobApplication.create!(job_id: @job.id, application_id: @application.id)
  end

  it "has a user" do
    expect(Application.first.user_id).to eq(@user.id)
  end
end
