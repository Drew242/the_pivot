class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id

      if @user.role == "admin"
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      flash.now[:danger] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
