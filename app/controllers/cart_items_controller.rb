class CartItemsController < ApplicationController
  def index
    @cart_items = cart.items
  end

  def create
    item = Item.find(params[:item_id])
    data = session[:cart] || Hash.new(0)
    data[item.id.to_s] += 1
    session[:cart] = data
    redirect_to items_path
  end
end
