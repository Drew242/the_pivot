class Item < ActiveRecord::Base
  belongs_to :category

  def self.random_items
    RandomItemsGenerator.generate(all)
  end

end
