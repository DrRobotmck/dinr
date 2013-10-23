class Restaurant < ActiveRecord::Base

validates :camis,:address,:date,:points, presence: true
has_and_belongs_to_many :users
end