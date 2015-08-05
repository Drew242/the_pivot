class User < ActiveRecord::Base
  has_secure_password

  def to_param
    "dashboard"
  end

end
