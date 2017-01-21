# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_params = {name: "admin",email: "admin@admin.com", 
		password: "123", password_confirmation: "123"}
user = User.create(user_params)
user_params = {name: "admin2",email: "admin2@admin.com", password: "123", password_confirmation: "123"}
user2 = User.create(user_params)
0.upto(10) do |t|
	user.products.create(name:"product#{t}",price:23,description:"fdsfds#{t}")
	user.tickets.create(name:"fds#{t}",price:34)
	user2.tickets.create(name:"ticket#{t}",price:340)
end