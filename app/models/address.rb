class Address < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :street_address, :city, :zip, :state
end
