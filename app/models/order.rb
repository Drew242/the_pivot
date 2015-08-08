class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  before_create :create_from_cart

  private

  def create_from_cart
    session[:cart].each do |item_id, quantity|
      OrderItem.create(quantity: quantity, item_id: item_id, order_id: id)
    end
  end
end
