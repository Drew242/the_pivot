class Item < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :price, presence: true 

  validates_uniqueness_of :title
end
