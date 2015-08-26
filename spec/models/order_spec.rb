require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = User.create!(username: "mitch", password: "password", role: 0)
    @job = Job.create!(title: "junior_developer", description: "wicked")
    @order = Order.create!(user_id: @user.id, status: 0)
    @order_job = OrderJob.create!(job_id: @job.id, order_id: @order.id)
  end

  it "has a user" do
    expect(Order.first.user_id).to eq(@user.id)
  end

  # it "has a total" do
  #   expect(@order.total).to eq(6)
  # end
  #
  # it "has a status" do
  #   expect(@order.status).to eq("ordered")
  # end
end
