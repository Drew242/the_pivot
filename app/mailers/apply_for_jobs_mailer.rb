class ApplyForJobsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.apply_for_jobs_mailer.notify_user.subject
  #
  def notify_user(user)
    @greeting = "Hi"
    @user = user
    mail to: user.email, subject: "You have successfully applied to your favorite jobs"


  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.apply_for_jobs_mailer.notify_admin.subject
  #
  def notify_admin(user)

    @user = user
    mail to: user.email,
      subject: "You have received an application for a job."
  end
end


