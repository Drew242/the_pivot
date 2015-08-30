class Company < ActiveRecord::Base
  has_many :jobs
  belongs_to :user

  validates :name, presence: true
  validates :information, presence: true
end
