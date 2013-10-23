# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Restaurant.destroy_all

file = File.new("/Users/macadocious/Desktop/sorted/poochies.txt", "r")

for restaurant in file do
  resto = restaurant.split(",")  
  seed_rest = Restaurant.create(camis: resto[1], address: resto[2], phone: resto[3], date: resto[4], points: resto[5].to_i, grade: resto[6], long: resto[7], lat: resto[8])
end
# Restaurant.create(camis: "ASS", address: "NILBOG LANE",phone: "23423423", date: "2013-09-08", points: 9001, grade: "A", longlat: "longitudinally latituding")
user = User.create(name: "A", email: "a@b.c", password: "a", password_confirmation: "a")

file.close