class Application < ActiveRecord::Base
  belongs_to :user
  has_many :job_applications
  has_many :jobs, through: :job_applications

  before_create :create_from_cart

  enum status: %w(ordered paid cancelled completed)

  attr_accessor :cart_data

  private

  def create_from_cart
    if cart_data
      cart_data.each do |job_id|
        job_applications.build(job_id: job_id.first.to_i, application_id: job_id.last)
      end
    end
  end
end
