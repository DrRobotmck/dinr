class Restaurant < ActiveRecord::Base

validates :camis,:name,:boro,:address,:date_in,:points, presence: true

end