class User < ActiveRecord::Base

  has_many :applications
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_one  :company
  has_secure_password
  validates_presence_of :username
  validates_presence_of :password, :unless => lambda{ |user| user.password.blank? }
  validates_uniqueness_of :username
  has_one :address
  validates_confirmation_of :password

  enum role: %w(default admin)

  def to_param
    "dashboard"
  end

  def registered_user?
    roles.exists?(name: 'registered_user')
  end

  def company_admin?
    roles.exists?(name: 'company_admin')
  end

  def platform_admin?
    roles.exists?(name: 'platform_admin')
  end

  def send_welcome_email
    UserMailer.send_welcome_email(self).deliver_now
  end

  mount_uploader :resume, ResumeUploader
end
