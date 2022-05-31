# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  namearray = Faker::TvShows::TwinPeaks.character.split
  user = User.new(
    email: "#{Faker::GreekPhilosophers.name.downcase}@gmail.com",
    first_name: namearray[0],
    last_name: namearray[1],
    password: "topsecret",
    password_confirmation: "topsecret"
  )
  toilet = Toilet.new(
    name: Faker::Movies::LordOfTheRings.location,
    price: rand(0..10_000),
    description: Faker::GreekPhilosophers.quote,
    user: user
  )
  user.save!
  toilet.save!
end
