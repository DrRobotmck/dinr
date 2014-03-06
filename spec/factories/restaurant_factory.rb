FactoryGirl.define do
	factory :restaurant do
		camis {Faker::PhoneNumber.phone_number}
		name 'poop'
		building {Faker::Address.building_number}
		street {Faker::Address.street_name}
		grade '9000'
		zip 11222
		cuisine 'poop'
		inspected '2012-12-12'
		boro {Faker::Address.city}
		score '1'
	end
end
