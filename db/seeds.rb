# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "luke allen",
             email: 'lukeallen@gmail.com',
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Jason",
             email: 'jasonmcnabb@growbiointensive.org',
             password:              "default",
             password_confirmation: "default",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Jonathan",
             email: 'jonathan.stroh@gmail.com',
             password:              "default",
             password_confirmation: "default",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
User.create!(name:  "Matt",
             email: 'me@mattslab.net',
             password:              "default",
             password_confirmation: "default",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

=begin

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

=end

Topic.create!(name:  "Information",
             language: 'en',
             main_content: "",
             category: 0,
             skill: 0)


Topic.create!(name:  "Action",
              language: 'en',
              main_content: "",
              category: 0,
              skill: 0)


Topic.create!(name:  "Support",
              language: 'en',
              main_content: "",
              category: 0,
              skill: 0)


topics = Topic.all
info = Topic.first
action = Topic.second
join = Topic.third
#t=topics[3]
#t.make_parent(info)





