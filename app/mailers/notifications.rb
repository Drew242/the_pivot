class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.mailer.subject
  #
  def mailer
    @greeting = "Hi"

    mail (
    to: email_params[:email],
    subject: "Message from"
    )
  end
end
