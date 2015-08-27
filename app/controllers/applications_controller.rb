class ApplicationsController < ApplicationController
  def index
    @applications = current_user.applications
  end

  def show
    @order = current_user.applications.find(params[:id])
  end

  def create
    @application = current_user.applications.build
    @application.cart_data = session[:cart] if session[:cart]
    if @application.save
      flash[:message] = "Applications successfully sent"
      session[:cart] = nil
      redirect_to applications_path
    else
      flash[:error] = "Your applications could not be sent. Please contact support."
      redirect_to root_path
    end
  end
end
