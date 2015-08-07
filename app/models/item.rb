class Item < ActiveRecord::Base
  belongs_to :category
  scope :top, -> { all.limit(10) }

  def self.random_items
    RandomItemsGenerator.generate(all)
  end

end
