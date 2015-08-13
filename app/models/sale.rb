class Sale < ActiveRecord::Base
  has_many :items
  validates :discount, numericality: { less_than: 100, greater_than: 0 }

  enum status: %w(active expired)

  def expire
    update! status: 1
  end
end
