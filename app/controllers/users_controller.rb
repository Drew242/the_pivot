class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      flash[:error] = "Need Username and Password"
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
