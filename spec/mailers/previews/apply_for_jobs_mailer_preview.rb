# Preview all emails at http://localhost:3000/rails/mailers/apply_for_jobs_mailer
class ApplyForJobsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/apply_for_jobs_mailer/notify_user
  def notify_user
    ApplyForJobsMailer.notify_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/apply_for_jobs_mailer/notify_admin
  def notify_admin
    ApplyForJobsMailer.notify_admin
  end

end
