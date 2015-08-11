class Item < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  validates_uniqueness_of :title
  scope :top, -> { all.limit(10) }

  def self.random_items
    RandomItemsGenerator.generate(all)
  end
end
