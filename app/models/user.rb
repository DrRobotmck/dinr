class User < ActiveRecord::Base

  validates :name, :email, presence: true
  validates_uniqueness_of :email
  has_secure_password
  has_and_belongs_to_many :restaurants
############## add favorite ##################
  def favorite(resto)
    unless self.restaurants.include?(resto)
      self.restaurants << resto
    end
  end

  def unfavorite(resto)
    self.restaurants.destroy(resto)    
  end
end

