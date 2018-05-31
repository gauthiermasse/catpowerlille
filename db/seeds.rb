# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
Item.delete_all

for x in 1..50 do

Item.create(title: Faker::Cat.name,description: Faker::Cat.breed,price: Faker::Number.decimal(2),url: "https://s3.eu-west-3.amazonaws.com/rails-chaton/cat#{x}.jpg")

x+=1
end

User.create(fullname: 'test test', email: 'test@test.test')
Cart.create(user_id: 1)

