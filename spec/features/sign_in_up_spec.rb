require 'spec_helper'

describe 'Sign Up' do
	it "makes a new user and goes to their account page" do
		visit root_path
		click_link 'Sign Up or Sign In'

		current_path.should == new_user_path
		within 'div.sign-up' do
			fill_in 'Name', with: "A"
			fill_in 'Email', with: "a@b.c"
			fill_in 'Password', with: "poop"
			fill_in 'Password confirmation', with: "poop"
			click_button 'Submit'
		end

		current_path.should == user_path(User.all.last.id)
		expect(page).to have_content "Account Information"
		page.assert_selector 'a.user_info'
		page.assert_selector 'div.grub_list'
	end	
	let(:user){FactoryGirl.create(:user)}
	it "signs in and takes you to the user page" do
		visit root_path
		click_link 'Sign Up or Sign In'

		current_path.should == new_user_path
		within 'div.sign-in' do
			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
			click_button 'Login'
		end
		current_path.should == user_path(user.id)
		expect(page).to have_content "Account Information"
		page.assert_selector 'a.user_info'
		page.assert_selector 'div.grub_list'
	end
end