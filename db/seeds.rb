# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

addresses = ["WMJQ+WPX, Edinburgh of the Seven Seas TDCU 1ZZ, St. Helena", "London SW1A 1AA, United Kingdom", "B1, Port-aux-Français, French Southern Territories", "5M39+4WX, Beaker St, McMurdo Station, Antarctica", "Marinevej 3, Nuuk 3900, Greenland", "1-1 Yobito, Abashiri, Hokkaido 099-2421, Japan"]
10.times do
  file = URI.open('https://source.unsplash.com/random/?outhouse')
  namearray = Faker::TvShows::TwinPeaks.character.split
  user = User.new(
    email: "#{Faker::GreekPhilosophers.name.gsub(/[^0-9A-Za-z]/, '').downcase}@#{Faker::App.name.gsub(/[^0-9A-Za-z]/, '').downcase}.com",
    first_name: namearray[0],
    last_name: namearray[1],
    password: "topsecret",
    password_confirmation: "topsecret"
  )
  toilet = Toilet.new(
    name: Faker::Movies::LordOfTheRings.location,
    price: rand(0..10_000),
    description: Faker::GreekPhilosophers.quote,
    user: user,
    address: addresses[rand(0..(addresses.length - 1))]
  )
  toilet.photos.attach(io: file, filename: 'toilet.png', content_type: 'image.png')
  user.save!
  toilet.save!
end

admin = User.new(
  email: "admin@eztoiletadmin.org",
  first_name: "Toiletman",
  last_name: "Ass",
  password: "toiletadmin",
  password_confirmation: "toiletadmin"
)
admin.save!
