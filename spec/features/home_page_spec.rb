require 'spec_helper'

describe 'visit home, search', js:true do
	10.times{FactoryGirl.create(:restaurant, name: 'poop', zip: 10011)}
	it "goes to the homepage and has restaurants" do
		visit root_path
		expect(page).to have_content 'din.r'
		expect(page).to have_content 'Sign Up or Sign In'
		page.has_css? "div.map"
		page.has_css? "div.choices"
		page.has_css? "button.small", count: 3
		page.has_css? "ul.restaurant-list"
		page.has_css? "form#search"
		within "ul.restaurant-list"do
			page.assert_selector 'li.each-one'
		end
	end
	10.times{FactoryGirl.create(:restaurant, name: 'doop',zip: 11212)}
	it "can search for a restaurant by zip", js:true do
		visit root_path
		fill_in 'search', with: 11212
		page.find('#search-string_1').native.send_keys(:return)
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one', text: 'doop'
		end
	end
	it "searches for a restaurant by name", js:true do
		visit root_path
		fill_in 'search', with: 'poop'
		page.find('#search-string_1').native.send_keys(:return)
		within 'ul.restaurant-list' do
			page.assert_selector 'li.each-one', text: 'poop'
		end
	end
end