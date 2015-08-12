class CartItemsController < ApplicationController
  def index
    @cart_items = cart.items
  end

  def create
    item = Item.find(params[:item_id])
    cart.add_item(item)
    session[:cart] = cart.data
    if request.referrer.include?("/items/")
      redirect_to items_path
    else
      redirect_to root_path
    end
  end

  def increment
    item = Item.find(params[:id])
    cart.add_item(item)
    session[:cart] = cart.data
    redirect_to cart_path
  end

  def decrement
    item = Item.find(params[:id])
    cart.decrease_item(item)
    session[:cart] = cart.data
    redirect_to cart_path
  end

  def destroy
    @item = Item.find(params[:id])
    cart.remove_item(@item)
    session[:cart] = cart.data
    flash[:notice] = render_to_string partial: "flash"
    redirect_to cart_path
  end
end
