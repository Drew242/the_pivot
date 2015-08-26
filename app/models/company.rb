class Company < ActiveRecord::Base
  has_many :jobs

  validates :name, presence: true
  validates :information, presence: true
end
