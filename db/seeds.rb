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
             admin: false,
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
             language: 'english',)

Topic.create!(name:  "Action",
              language: 'english',)

Topic.create!(name:  "Join",
              language: 'english',)

topics = Topic.all
info = Topic.first
action = Topic.second
join = Topic.third
#t=topics[3]
#t.make_parent(info)

Topic.create!(name:  "Library",
              language: 'english',
              main_content: "All this info is real cool"
              )
Topic.last.make_parent(info)

Topic.create!(name:  "Dig Deeper Basic Needs",
              language: 'english',
              main_content: "the basic needs are here"
              )
last_topic = Topic.last
last_topic.make_parent(info)

  Topic.create!(name:  "Water",
              language: 'english',
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Farmable Soil",
              language: 'english',
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Food / Nutrients",
              language: 'english',
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Energy",
              language: 'english',
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Atmosphere",
              language: 'english',
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Wild Space",
              language: 'english',
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)
  Topic.create!(name:  "Peace",
              language: 'english',
              main_content: "the basic needs are here"
  )
  Topic.last.make_parent(last_topic)



Topic.create!(name:  "8 Components of Grow BioIntensive",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Soil & Soil Building",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Food, Diet, & Human Health",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Garden Planning, Economics, & Scalability",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Human Impact and Sustainability",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "EcoSystem",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(info)

Topic.create!(name:  "Learn / Train",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Grow",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Teach",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Rate Your Sustainability",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(action)

Topic.create!(name:  "Join Us",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Start a Project",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Volunteer / Translate",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "About Ecology Action",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Network",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(join)

Topic.create!(name:  "Kids",
              language: 'english',
              main_content: "All this info"
)
Topic.last.make_parent(join)







