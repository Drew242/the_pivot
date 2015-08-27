require "rails_helper"

RSpec.describe Cart, type: :model do
  let!(:company) { Company.create!(name: "acme",
                                   information: "asdf") }

  let!(:job) { company.jobs.create!(title: "Job 1",
                                    description: "Job 1 description") }

  context "#jobs" do
    it "returns an array of CartJobs" do
      data = Hash.new(0)
      data[job.id] = 2
      cart = Cart.new(data)

      expect(cart.jobs.first).to be_a_kind_of(CartJob)
    end
  end

  context "cart total" do

    let(:job2) { Job.create(title: "Job 2", description: "Description 2") }

    let(:cart) { Cart.new(job.id => 1, job2.id => 2) }

    it "calculates a cart total" do
      expect(cart.total).to eq(2)
    end
  end
end
