class Job < ActiveRecord::Base
  belongs_to :company
  validates :title, presence: true
  validates :description, presence: true

  validates_uniqueness_of :title
  scope :top, -> { all.limit(10) }

  def self.random_jobs
    RandomJobsGenerator.generate(all)
  end
end
