class Company < ActiveRecord::Base
  extend FriendlyId
  has_many :jobs
  belongs_to :user

  friendly_id :slug_candidates, use: [:slugged, :finders]

  validates :name, presence: true
  validates :information, presence: true

  def slug_candidates
    [
      :name,
      [:name, :id]
    ]
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
