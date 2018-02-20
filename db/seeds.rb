# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  email: "user1@email.com",
  password: "111111",
  password_confirmation: "111111"
)

user.skip_confirmation!
user.save!

10.times do
  RegisteredApplication.create!(
    name: Faker::Internet.domain_name,
    url: Faker::Internet.url,
    user: user
  )
end

applications = RegisteredApplication.all

50.times do
  Event.create!(
    name: Faker::Internet.domain_word,
    registered_application: applications.sample
  )
end
