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
  file_oathouse = URI.open('https://source.unsplash.com/random/?outhouse')
  file_toilet = URI.open('https://source.unsplash.com/random/?toilet')
  file_panorama = URI.open('https://source.unsplash.com/random/?panorama')
  file_avatar = URI.open('https://source.unsplash.com/random/?person')
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
    currency: "€",
    description: Faker::GreekPhilosophers.quote,
    user: user,
    address: addresses[rand(0..(addresses.length - 1))]
  )
  feature1 = Feature.new(
    name: "Toilet Paper",
    presence: [true, false].sample,
    details: Faker::GreekPhilosophers.quote,
    toilet: toilet
  )
  feature2 = Feature.new(
    name: "Bidet",
    presence: [true, false].sample,
    details: Faker::GreekPhilosophers.quote,
    toilet: toilet
  )
  feature3 = Feature.new(
    name: "Brush",
    presence: [true, false].sample,
    details: Faker::GreekPhilosophers.quote,
    toilet: toilet
  )
  feature4 = Feature.new(
    name: "Window",
    presence: [true, false].sample,
    details: Faker::GreekPhilosophers.quote,
    toilet: toilet
  )
  feature5 = Feature.new(
    name: "Amazing View",
    presence: [true, false].sample,
    details: Faker::GreekPhilosophers.quote,
    toilet: toilet
  )
  feature6 = Feature.new(
    name: "Air Freshner",
    presence: [true, false].sample,
    details: Faker::GreekPhilosophers.quote,
    toilet: toilet
  )
  feature7 = Feature.new(
    name: "Magazines",
    presence: [true, false].sample,
    details: Faker::GreekPhilosophers.quote,
    toilet: toilet
  )
  toilet.photos.attach(io: file_oathouse, filename: 'oathouse.png', content_type: 'image.png')
  toilet.photos.attach(io: file_toilet, filename: 'toilet.png', content_type: 'image.png')
  toilet.photos.attach(io: file_panorama, filename: 'panorama.png', content_type: 'image.png')
  user.avatar.attach(io: file_avatar, filename: 'avatar.png', content_type: 'image.png')
  user.save!
  toilet.save!
  feature1.save!
  feature2.save!
  feature3.save!
  feature4.save!
  feature5.save!
  feature6.save!
  feature7.save!
end

admin = User.new(
  email: "admin@eztoiletadmin.org",
  first_name: "Toiletman",
  last_name: "Ass",
  password: "toiletadmin",
  password_confirmation: "toiletadmin"
)
admin.save!

dareos = User.new(
  email: "dareos@eztoilet.com",
  first_name: "Dareos",
  last_name: "Lewagon",
  password: "dareostoilet",
  password_confirmation: "dareostoilet"
)
dareos.save!

ivo = User.new(
  email: "ivo@eztoilet.com",
  first_name: "Ivo",
  last_name: "Lewagon",
  password: "ivotoilet",
  password_confirmation: "ivotoilet"
)
ivo.save!
