class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize!

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  helper_method :cart

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_permission
    @current_permission ||= PermissionService.new(current_user)
  end

  def authorize!
    redirect_to root_url, danger: "You don't know me." unless authorized?
  end

  helper_method :current_user

  def company_admin?
    current_user && current_user.company_admin?
  end

  helper_method :company_admin?

  def render_not_found
    render "/public/404", status: 404
  end

  def current_company
    @current_company ||= Company.find(params[:id]) if params[:company]
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end
end
