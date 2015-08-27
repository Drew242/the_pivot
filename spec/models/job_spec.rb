require "rails_helper"

RSpec.describe Job, type: :model do
  let!(:company) { Company.create!(name: "acme",
                                   information: "asdf") }

  let!(:job) { company.jobs.create!(title: "Job 1",
                                    description: "Job 1 description") }


  it "is valid" do
    expect(job).to be_valid
  end

  it "has a company" do
    expect(job.company.name).to eq("acme")
  end

  it 'is invalid without a title' do
    job.title = nil
    expect(job).to  be_invalid
  end

  it 'is invalid without a description' do
    job.description = nil
    expect(job).to  be_invalid
  end
end
