require 'rails_helper'

RSpec.describe OrderJob, type: :model do
  before do
    @user = User.create!(username: "mitch", password: "password", role: 0)
    @job = Job.create!(title: "junior_developer", description: "wicked")
    @order = Order.create!(user_id: @user.id, status: 0)
    @order_job = OrderJob.create!(job_id: @job.id, order_id: @order.id)
  end

  it "belongs to an job" do
    expect(@order_job.job_id).to eq(@job.id)
  end

  it "belongs to an order" do
    expect(@order_job.order_id).to eq(@order.id)
  end

  # it "has a quantity" do
  #   expect(@order_item.quantity).to eq(2)
  # end
end