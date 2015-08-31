class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.role == 0
        redirect_to root_path
      else
        redirect_to dashboard_path
      end
    else
      flash[:error] = "Need Username and Password"
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:error] = "User Profile updated!"
      redirect_to dashboard_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :street_address,
                                :city, :state, :zipcode, :email, :resume)
  end
end
