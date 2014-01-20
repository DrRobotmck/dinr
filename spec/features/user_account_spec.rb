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
describe 'edit an account' do
	jake = FactoryGirl.create(:user)
	it "allows a user to edit their account information" do
		visit new_user_path
		within '.sign-in' do
			fill_in 'Email', with: jake.email 
			fill_in 'Password', with: jake.password
			click_button 'Login'
		end
		current_path.should == user_path(jake.id)
		page.should have_content 'Account Information'
		page.should have_content 'Edit your account'
		click_link 'Edit your account'

		current_path.should == edit_user_path(jake.id)
		page.should have_content "#{jake.name}"
		page.should have_content "#{jake.email}"
		page.assert_selector 'form'
		page.has_link? 'a.links', text: 'Back'
		page.has_link? 'a.links', text: 'Delete Account'
		jake.name = 'Paul'
		within 'div.forms' do
			fill_in 'Name', with: jake.name
			fill_in 'Email', with: jake.email
			fill_in 'Password', with: 'poot'
			fill_in 'Password confirmation', with: 'poot'
			click_button 'Submit'
		end
		current_path.should == user_path(jake.id)
		page.should have_content "#{jake.name}"
		expect(jake.name).to eq('Paul')
	end
end

describe 'a user can delete their account' do
	josh = FactoryGirl.create(:user)
	it "goes to the user edit page and can choose to delete their account" do
		visit new_user_path
		within '.sign-in' do
			fill_in 'Email', with: josh.email 
			fill_in 'Password', with: josh.password
			click_button 'Login'
		end
		click_link 'Edit your account'

		current_path.should == edit_user_path(josh.id)
		page.should have_content 'Edit your information'
		click_link 'Delete Account'
		current_path.should == root_path
	end
end