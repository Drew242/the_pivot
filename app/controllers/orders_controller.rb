class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    @order = current_user.orders.build
    @order.cart_data = session[:cart] if session[:cart]
    if @order.save
      flash[:message] = "Order was successfully placed"
      session[:cart] = nil
      redirect_to orders_path
    else
      flash[:error] = "Your order could not be placed. Please contact support."
      redirect_to root_path
    end
  end
end
