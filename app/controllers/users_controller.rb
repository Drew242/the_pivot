class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      @user.roles << Role.find_by(name: "registered_user")

      if @user.roles.include?("registered_user")
        NotificationsMailer.contact(email_params).deliver_now
        redirect_to root_path
      elsif @user.roles.include?("company_admin")
        redirect_to dashboard_path
      else
        redirect_to root_path
      end
    else
      flash.now[:danger] = "Username and Password must be unique and both fields must be filled"
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

  def email_params
    params.permit(:username, :message)
  end
end
