# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

10.times do
  file = URI.open('https://images.unsplash.com/photo-1502592238809-4cba3c1b80bc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8b3V0aG91c2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')
  namearray = Faker::TvShows::TwinPeaks.character.split
  user = User.new(
    email: "#{Faker::GreekPhilosophers.name.downcase}@#{Faker::App.name.gsub(" ", "")}.com",
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
  toilet.photos.attach(io: file, filename: 'toilet.png', content_type: 'image.png')
  user.save!
  toilet.save!
end
