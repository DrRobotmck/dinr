class Restaurant < ActiveRecord::Base

validates :camis,:name,:building,:street,:zip,:cuisine,:inspected, presence: true
#belongs_to :user
has_and_belongs_to_many :users

#private
	def self.unique(zip)
		if zip.to_i > 0
			all_rants = self.select(:name,:camis,:score,:id,:building,:street).distinct.where(zip: zip).limit(2000)
		else
		 all_rants = self.select(:name,:camis,:score,:id,:building,:street).distinct.where("LOWER(name) SIMILAR TO ?", "%"+zip.downcase+"%").limit(2000).order(camis: :asc) 
		end
		singles = []
		all_rants.each do |a|
			if singles.length == 0 
				singles.push(a)
			elsif !(singles.last.camis == a.camis)
				singles.push(a)
			end
		end
		return singles
	end
end