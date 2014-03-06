FactoryGirl.define do
	factory :user do
		name {Faker::Name.name}
		email {Faker::Internet.email}
		password 'poop'
		password_confirmation 'poop'
	end
end