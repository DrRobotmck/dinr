class Favorite < ActiveRecord::Base

  validates_uniqueness_of :url, presence: true
  

end