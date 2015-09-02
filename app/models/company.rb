class Company < ActiveRecord::Base
  extend FriendlyId
  has_many :jobs
  belongs_to :user

  friendly_id :slug_candidates, use: :slugged

  validates :name, presence: true
  validates :information, presence: true

  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end
end
