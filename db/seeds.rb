# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Restaurant.destroy_all

def uniq_camis(boro)
	camis = []
	boro.each do |number|
		camis.push(number[0])
	end
	camis.uniq 
end

def add_to_rest_hash(hash,boro,keys)
	keys.each do |key|
		hash[boro][key.to_sym] = []
	end
end
def add_by_camis(hash,boro,restaurants)
	restaurants.each do |one_resto|
		hash[boro][one_resto[0].to_sym].push(one_resto)
	end
end
def seed_me(hash, boro, geocoded)
	geocode = geocoded
	hash[boro].each do |camis,inspections|
		inspections.each do |inspection|
			begin
			Restaurant.create(camis: inspection[0], name: inspection[1], building: inspection[3], street: inspection[4], zip: inspection[5], phone: inspection[6], cuisine: inspection[7], inspected: inspection[8], action: inspection[9], violation: inspection[10], score: inspection[11], grade: inspection[12], grade_date: inspection[13], boro: inspection[2], lat: geocode[inspection[0].to_sym][0], long: geocode[inspection[0].to_sym][1])
			rescue
			Restaurant.create(camis: inspection[0], name: inspection[1], building: inspection[3], street: inspection[4], zip: inspection[5], phone: inspection[6], cuisine: inspection[7], inspected: inspection[8], action: inspection[9], violation: inspection[10], score: inspection[11], grade: inspection[12], grade_date: inspection[13], boro: inspection[2], lat: 0.00, long: 0.00)
			end
		end
	end
end

manhattan = []
brooklyn = []
queens = []
bronx = []
staten = []
read_in = File.new("/Users/macadocious/Downloads/dohmh_restaurant-inspections_002/WebExtract.txt", "r")
read_in.each do |line|

	b = line.split("\",\"")
	b[0] = b[0][1..8]
	if b[8][0..3] == "2013"
		boro = b[2]
		case boro
		when "1"
			manhattan << b[0..13]
		when "2"
			bronx << b[0..13]
		when "3"
			brooklyn << b[0..13]
		when "4"
			queens << b[0..13]
		when "5"
			staten << b[0..13]
		end
	end
end
read_in.close
man_camis = uniq_camis(manhattan)
bk_camis = uniq_camis(brooklyn)
bx_camis = uniq_camis(bronx)
q_camis = uniq_camis(queens)
s_camis = uniq_camis(staten)

rest_hash = {manhattan: {}, brooklyn: {}, queens: {}, bronx: {}, staten: {}}

add_to_rest_hash(rest_hash,:manhattan,man_camis)
add_to_rest_hash(rest_hash, :brooklyn, bk_camis)
add_to_rest_hash(rest_hash, :bronx, bx_camis)
add_to_rest_hash(rest_hash, :queens, q_camis)
add_to_rest_hash(rest_hash, :staten, s_camis)

add_by_camis(rest_hash,:manhattan,manhattan)
add_by_camis(rest_hash,:brooklyn,brooklyn)
add_by_camis(rest_hash,:bronx,bronx)
add_by_camis(rest_hash,:queens,queens)
add_by_camis(rest_hash,:staten,staten)

# rest_hash[:manhattan].each do |camis,inspection|
# 	Restaurant.create(camis: inspection[0], name: inspection[1], building: inspection[3], street: inspection[4], zip: inspection[5], phone: inspection[6], cuisine: inspection[7], inspected: inspection[8], action: inspection[9], violation: inspection[10], score: inspection[11], grade: inspection[12], grade_date: inspection[2])
# end
# rest_hash[:brooklyn].each do |camis,inspection|
# 	Restaurant.create(camis: inspection[0], name: inspection[1], building: inspection[3], street: inspection[4], zip: inspection[5], phone: inspection[6], cuisine: inspection[7], inspected: inspection[8], action: inspection[9], violation: inspection[10], score: inspection[11], grade: inspection[12], grade_date: inspection[2])
# end
# rest_hash[:bronx].each do |camis,inspection|
# 	Restaurant.create(camis: inspection[0], name: inspection[1], building: inspection[3], street: inspection[4], zip: inspection[5], phone: inspection[6], cuisine: inspection[7], inspected: inspection[8], action: inspection[9], violation: inspection[10], score: inspection[11], grade: inspection[12], grade_date: inspection[2])
# end
# rest_hash[:queens].each do |camis,inspection|
# 	Restaurant.create(camis: inspection[0], name: inspection[1], building: inspection[3], street: inspection[4], zip: inspection[5], phone: inspection[6], cuisine: inspection[7], inspected: inspection[8], action: inspection[9], violation: inspection[10], score: inspection[11], grade: inspection[12], grade_date: inspection[2])
# end
# rest_hash[:staten].each do |camis,inspection|
# 	Restaurant.create(camis: inspection[0], name: inspection[1], building: inspection[3], street: inspection[4], zip: inspection[5], phone: inspection[6], cuisine: inspection[7], inspected: inspection[8], action: inspection[9], violation: inspection[10], score: inspection[11], grade: inspection[12], grade_date: inspection[2])
# end
geocode = {}
long_lat = File.open("/Users/macadocious/Desktop/latlong.csv","r")
long_lat.each do |one|
	split_up = one.split(",")
	geocode[split_up[0].to_sym] = [split_up[4],split_up[5].gsub("\n","")]
end
long_lat.close
seed_me(rest_hash,:manhattan,geocode)
seed_me(rest_hash,:brooklyn,geocode)
seed_me(rest_hash,:bronx,geocode)
seed_me(rest_hash,:queens,geocode)
seed_me(rest_hash,:staten,geocode)

user = User.create(name: "A", email: "a@b.c", password: "a", password_confirmation: "a")

