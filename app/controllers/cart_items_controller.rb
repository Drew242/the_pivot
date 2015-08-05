class CartItemsController < ApplicationController
  def index
    @cart_items = cart.items
  end

  def create
    session[:cart] = # Hash.new(0)
    redirect_to items_path
  end
end
