class User < ActiveRecord::Base

  has_many :applications
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_one  :company
  has_secure_password
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_one :address

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

  mount_uploader :resume, ResumeUploader
end
