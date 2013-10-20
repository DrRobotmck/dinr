class User < ActiveRecord::Base

  validates_uniqueness_of :email, presence: true
  has_secure_password

end