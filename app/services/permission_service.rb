class PermissionService
  attr_reader :user,
              :controller,
              :action

  def initialize(user)
    @user = user
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    if user && user.registered_user?
      registered_user_permissions
    elsif user && user.company_admin?
      company_admin_permissions
    elsif user && user.platform_admin?
      platform_admin_permissions
    else
      guest_user_permissions
    end
  end

  private

  def guest_user_permissions
    return true
    # return true if controller == 'welcome'
    # return true if controller == 'jobs' && action.in?(%w(index show))
    # return true if controller == 'companies' && action.in?(%w(index show))
    # return true if controller == 'company/job' && action.in?(%w(index show))
    # return true if controller == 'categories' && action.in?(%w(show index))
    # return true if controller == 'users' && action.in?(%w(new create))
    # return true if controller == 'sessions' && action.in?(%w(new create destroy))
  end

  def registered_user_permissions
    # return true
    return true if controller == 'welcome'
    return true if controller == 'users'
    return true if controller == 'jobs' && action.in?(%w(index))
    return true if controller == 'companies' && action.in?(%w(index show new create))
    return true if controller == 'company/job' && action.in?(%w(index show))
    return true if controller == 'categories' && action.in?(%w(show index))
    return true if controller == 'sessions' && action.in?(%w(new create destroy))
    return true if controller == 'cart_jobs' && action.in?(%w(index create destroy))
  end

  def company_admin_permissions
    return true if controller != 'users'
  end

  def platform_admin_permissions
    return true
  end
end
