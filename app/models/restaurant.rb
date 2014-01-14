class Restaurant < ActiveRecord::Base

validates :camis,:name,:building,:street,:zip,:cuisine,:inspected, presence: true
#belongs_to :user
has_and_belongs_to_many :users

#private
	def self.unique
		all_rants = self.select(:name,:camis,:score,:id,:building,:street).distinct.where(boro: '1').limit(6000)
		singles = []
		all_rants.each do |a|
			if !singles.keys.include?(a.camis)
				singles[a.camis] = a
			end
		end
		return singles.values
	end
end