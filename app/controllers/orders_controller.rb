class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    @order = Order.new()
    @order.cart_data = session[:cart]
    current_user.orders << @order
    if @order.save
      flash[:message] = "Order was successfully placed"
      redirect_to orders_path
    else
      flash[:error] = "Your order could not be placed. Please contact support."
      redirect_to root_path
    end
  end
end
