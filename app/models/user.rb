class User < ActiveRecord::Base

  validates_uniqueness_of :email, presence: true
  has_secure_password
  has_and_belongs_to_many :restaurants

end