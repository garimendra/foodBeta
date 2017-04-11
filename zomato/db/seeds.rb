# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
data= ActiveSupport::JSON.decode(File.read('db/seeds/restaurants.json'))
data.each do |line|
	new_record = Restaurant.new(JSON.parse(line.to_json)) 
	new_record.save
end
data= ActiveSupport::JSON.decode(File.read('db/seeds/menu.json'))
data.each do |line|
	new_record = Menu.new(JSON.parse(line.to_json)) 
	new_record.save
end
=begin
Obj = { "name":"Punjabi Rasoi", "accomodation":30, "timings":"9:00 AM to 8:00 PM","contactnum":"123456","region":"Dwarka","address":"Dwarka sec6","cost":400 };
data = Obj.to_json;
new_record = Restaurant.new(JSON.parse(data)) 
new_record.save
=end