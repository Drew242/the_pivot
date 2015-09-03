module ApplicationHelper

  def registered_user?
    current_user && current_user.registered_user
  end

  def job_status(status)
    return "btn-success" if status == "active"
    "btn-danger"
  end
end
