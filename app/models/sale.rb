class Sale < ActiveRecord::Base
  has_many :items
  validates :discount, numericality: { less_than: 100, greater_than: 0 }
end
