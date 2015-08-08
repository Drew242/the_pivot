class Item < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :price, presence: true

  validates_uniqueness_of :title
  scope :top, -> { all.limit(10) }

  def self.random_items
    RandomItemsGenerator.generate(all)
  end
end
