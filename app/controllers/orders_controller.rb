class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    @order = Order.new
    session[:cart]
    redirect_to orders_path
  end
end
