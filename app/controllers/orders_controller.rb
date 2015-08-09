class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new()
    @order.cart_data = session[:cart]
    current_user.orders << @order
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
