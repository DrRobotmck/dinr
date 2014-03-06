class Inspection

	attr_accessor :inspection

	def initialize
		@inspection = []
	end

	def get_result(id)
		all_rests = Restaurant.where(camis: id).order(:inspected).reverse_order
		this_one = {}
		for rests in all_rests do
			if this_one.keys.include?(rests.inspected)
				this_one[rests.inspected] << rests.violation
			else
				this_one[rests.inspected] = []
				this_one[rests.inspected] << rests.violation
			end
		end
		this_one
	end

end