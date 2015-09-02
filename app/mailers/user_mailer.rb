class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.mailer.subject
  #
  def send_welcome_email(user)
    @user = user

    mail(
    to: @user.email,
    subject: "Welcome to Technically Employed",
    )
  end
end
