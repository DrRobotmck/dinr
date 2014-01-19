require 'spec_helper'

describe 'visit single restaurant page',js:true do
	FactoryGirl.create(:restaurant, name: 'boop', zip: 11111)
	it "goes to the homepage and clicks a restaurant" do
		visit root_path
		fill_in 'search', with: 11111
		page.find('#search-string_1').native.send_keys(:return)
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one'
			first('a.links').click
		end
		expect(page).to have_content 'Name'
		expect(page).to have_content 'Grade'
		expect(page).to have_content 'Address'
		page.has_css? 'h2.name'
		page.has_css? 'h2.grade'
		expect(page).to have_content 'Violation History'

		click_link 'View All'
		current_path.should == root_path
	end
	10.times{FactoryGirl.create(:restaurant, name: 'coop', zip: 10011)}
	it "searches for a restaurant and returns to homepage with results" do
		visit root_path
		
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one'
			first('a.links').click
		end
		
		fill_in 'search', with: 11111
		page.find('#search-string_1').native.send_keys(:return)
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one'
			first('li.each-one').has_text? 'boop'
		end
		current_path.should == restaurants_path
	end
	user = FactoryGirl.create(:user)

	it "allows logged in users to favorite the restaurant" do
		visit root_path
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one'
			first('a.links').click
		end
		expect(page).to have_content 'Violation History'
		within 'div.rest_info' do 
			page.has_no_selector? 'a.links', text: 'Save to Grub List'
			page.has_no_selector? 'a.links', text: 'My Profile'
		end
		click_link 'Sign Up or Sign In'

		current_path.should == new_user_path
		within 'div.sign-in' do
			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
			click_button 'Login'
		end
		current_path.should == user_path(user.id)

		click_link 'din.r'
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one'
			first('a.links').click
		end
		within 'div.rest_info' do 
			page.has_selector? 'a.links', text: 'Save to Grub List'
			page.has_selector? 'a.links', text: 'My Profile'
			click_link 'Save to Grub List'
			click_link 'My Profile'
		end
		current_path.should == user_path(user.id)
		within '.grub_list' do
			page.assert_selector 'h3.favorite', count: 3
			page.assert_selector 'a.links_user', text: 'Remove'
		end


	end
end