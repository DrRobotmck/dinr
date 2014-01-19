require 'spec_helper'

describe Restaurant do
	describe '#new' do
		before do
			9.times{FactoryGirl.create(:restaurant)}
		end
		it { should validate_presence_of :name }
		it { should validate_presence_of :camis }
		it { should validate_presence_of :building }
		it { should validate_presence_of :street }
		it { should validate_presence_of :zip }
		it { should validate_presence_of :cuisine }
		it { should validate_presence_of :inspected }
		it { should validate_presence_of :boro }
	end
	describe '#unique' do
		before do
			10.times{FactoryGirl.create(:restaurant)}
			10.times{FactoryGirl.create(:restaurant, name: 'snoop', zip: 10001)}
		end
		it "returns restaurants based on zip code or name" do
			query = "11222"
			query2 = "snoop"
			return_value = Restaurant.unique(query)
			return_by_name = Restaurant.unique(query2)
			expect(return_value.count).to eq(10)
			expect(return_by_name.count).to eq(10)
		end
		context "#search_by_name" do
			it "searches by name and returns a sorted list of restaurants by camis" do
				query = "poop"
				returned = Restaurant.search_by_name(query)
				expect(returned.first.camis.to_i).to be < returned.last.camis.to_i
			end
		end
		context "#search_by_zip" do
			it "searches by zip and returns a list of restaurants in that zip code" do
				query = "10001"
				returned = Restaurant.search_by_zip(query)
				expect(returned.first.zip).to eq(returned.last.zip)
				expect(returned.count).to eq(10);
			end
		end

	end
end