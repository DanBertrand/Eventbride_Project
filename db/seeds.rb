# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"


User.destroy_all



3.times do
	user = User.create!(
		description: Faker::Lorem.paragraphs(rand(2..8)).join('\n'), 
		first_name: Faker::Name.first_name, 
		last_name: Faker::Name.last_name,
		email: Faker::Name.last_name + "@yopmail.com", 
		encrypted_password:"password")
end
puts "#{tp User.all}"

