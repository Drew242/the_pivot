class User < ActiveRecord::Base
  has_many :orders
  has_secure_password
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  has_one :address

  enum role: %w(default admin)

  def to_param
    "dashboard"
  end

end
