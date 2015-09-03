class UsersController < ApplicationController

  def new
    @user = User.new
    @applications = @user.applications if @user.applications
  end

  def create

    @user = User.new(user_params)
    @user.roles << Role.find_by(name: "registered_user")

    if @user.save
      @user.send_welcome_email
      flash[:success] = "Account activation sent to #{@user.email}"
      session[:user_id] = @user.id

      if @user.roles.include?("registered_user")
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
    @applications = @user.applications if @user.applications
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
    params.permit(:email, :message)
  end
end
