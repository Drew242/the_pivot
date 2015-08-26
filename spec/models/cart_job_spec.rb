require "rails_helper"

RSpec.describe CartJob, type: :model do
  let!(:job) { Job.new(title: "Job 1", description: "Job 1 description") }

  it "returns the title of the job" do
    cart_job = CartJob.new(job)

    expect(cart_job.title).to eq("Job 1")
  end

  it "returns the description of the job" do
    cart_job = CartJob.new(job)

    expect(cart_job.description).to eq("Job 1 description")
  end
end
