class Job < ActiveRecord::Base
  belongs_to :category
  belongs_to :company
  has_many   :job_applications
  has_many   :applications, through: :job_applications
  validates  :title, presence: true
  validates  :description, presence: true

  enum status: %w(active inactive)
end
