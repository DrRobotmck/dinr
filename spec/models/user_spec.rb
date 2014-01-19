require 'spec_helper'

	describe User do
		before{2.times {FactoryGirl.create(:user)}}
		it{should validate_presence_of(:name)}
		it{should validate_presence_of(:email)}
		it{should validate_uniqueness_of(:email)}
	end
	
	describe "#favorite" do
			let(:user){user = FactoryGirl.create(:user)}
			let(:resto){FactoryGirl.create(:restaurant)}
			before{user.favorite(resto)}
		it "checks if the user has that restaurant already and adds if it doesnt" do
			expect(user.restaurants.include?(resto)).to be_true
			expect(user.restaurants.count).to eq(1)
		end
		before{user.favorite(resto)}
		it "does not add the restaurant if it already exists" do
			expect(user.restaurants.include?(resto)).to be_true
			expect(user.restaurants.count).to eq(1)
		end
	end

	describe "#unfavorite" do
		let(:user){FactoryGirl.create(:user)}
		let(:resto){FactoryGirl.create(:restaurant)}
		let(:resto2){FactoryGirl.create(:restaurant)}
		before do
			user.restaurants.push(resto,resto2)
			user.unfavorite(resto)
		end
		it "removes the restaurant from the users collection" do
			expect(user.restaurants.count).to eq(1)
			expect(user.restaurants.include?(resto)).to be_false
		end

	end