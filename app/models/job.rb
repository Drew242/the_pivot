class Job < ActiveRecord::Base
  belongs_to :category
  belongs_to :company
  has_many   :job_applications
  has_many   :applications, through: :job_applications
  belongs_to :sale
  validates  :title, presence: true
  validates  :description, presence: true

  fuzzily_searchable :title
  fuzzily_searchable :location

  # scope :top, -> { all.limit(10) }

  enum status: %w(active inactive)
end
