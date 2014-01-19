class Restaurant < ActiveRecord::Base

validates :camis,:name,:building,:street,:zip,:cuisine,:inspected,:boro, presence: true
#belongs_to :user
has_and_belongs_to_many :users

#private
	def self.search_by_zip(zip_code)
		all_rants = self.select(:name,:camis,:score,:id,:building,:street,:zip).distinct.where(zip: zip_code).limit(2000)
	end
	def self.search_by_name(name)
		all_rants = self.select(:name,:camis,:score,:id,:building,:street,:zip).distinct.where("LOWER(name) SIMILAR TO ?", "%"+name.downcase+"%").limit(2000).order(camis: :asc) 
		# binding.pry
	end
	def self.unique(query_string)
		if query_string.to_i > 0
			zip_code = query_string
			result = self.search_by_zip(zip_code)
		elsif( query_string.to_i == 0)
			name = query_string 
			result = self.search_by_name(name)
		end
		singles = []
		result.each do |a|
			if singles.length == 0 
				singles.push(a)
			elsif !(singles.last.camis == a.camis)
				singles.push(a)
			end
		end
		
		return singles
	end

	
end