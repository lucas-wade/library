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
             language: 1,
             main_content: "" )


Topic.create!(name:  "Action",
              language: 1,
              main_content: "" )


Topic.create!(name:  "Support",
              language: 1,
              main_content: "" )


topics = Topic.all
info = Topic.first
action = Topic.second
join = Topic.third
#t=topics[3]
#t.make_parent(info)


Topic.create!(name:  "Basic Needs & GROW BIOINTENSIVE®",
              language: 1,
              main_content: "the basic needs are here"
              )
last_topic = Topic.last
last_topic.make_parent(info)

  Topic.create!(name:  "Water",
              language: 1,
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Farmable Soil",
              language: 1,
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Food / Nutrients",
              language: 1,
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Energy",
              language: 1,
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Atmosphere",
              language: 1,
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Wild Space",
              language: 1,
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Peace",
              language: 1,
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)



Topic.create!(name:  "8 Components of GROW BIOINTENSIVE®",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Soil & Soil Building",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Food, Diet, & Human Health",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Garden Planning, Economics, & Scalability",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Human Impact and Sustainability",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "EcoSystem",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Learn / Train",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Grow",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Teach",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Rate Your Sustainability",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Join Us",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Start a Project",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Volunteer / Translate",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "About Ecology Action",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Network",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Kids",
              language: 1,
              main_content: "All this info"
)
Topic.last.make_parent(join)







