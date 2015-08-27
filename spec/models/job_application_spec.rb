require 'rails_helper'


# this used to be OrderItem

RSpec.describe JobApplication, type: :model do
  before do
    @user = User.create!(username: "mitch", password: "password", role: 0)
    company = Company.create!(name: "acme", information: "asdf")
    @job = company.jobs.create!(title: "junior_developer", description: "wicked")
    @application = Application.create!(user_id: @user.id, status: 0)
    @job_application = JobApplication.create!(job_id: @job.id, application_id: @application.id)
  end

  it "belongs to an job" do
    expect(@job_application.job_id).to eq(@job.id)
  end

  it "belongs to an order" do
    expect(@job_application.application_id).to eq(@application.id)
  end
end
