require 'spec_helper'

describe 'unfavorite a restaurant', js:true do 
	10.times{FactoryGirl.create(:restaurant, name: 'poop', zip: 10011)}
	john = FactoryGirl.create(:user)
	it "goes to the user page, and unfavorites the restaurant" do
		visit	new_user_path
		within '.sign-in' do
			fill_in 'Email', with: john.email
			fill_in 'Password', with: john.password
			click_button 'Login'
		end
		visit root_path
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one'
			first('a.links').click
		end
		within 'div.rest_info' do
			page.has_selector? 'a.links', text: 'Save to Grub List'
			click_link 'Save to Grub List'
		end
		visit user_path(john.id)
		expect(john.restaurants.count).to eq(1)
		current_path.should == user_path(john.id)
		within '.grub_list' do
			page.assert_selector 'a.links_user', text: 'Remove'
			click_link 'Remove'
		end
		expect(john.restaurants.count).to eq(0)
	end
end