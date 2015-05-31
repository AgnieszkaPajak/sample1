# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Admin User",
             email: "admin@admin.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

 20.times do |n|
  name  = Faker::Name.name
  email = "111-#{n+1}@111.pl"
  password = "111"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
 end
 
 users = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end