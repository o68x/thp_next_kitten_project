# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

sleep(1)
User.destroy_all
Cat.destroy_all

sleep(1)
ActiveRecord::Base.connection.reset_pk_sequence!('cats')
ActiveRecord::Base.connection.reset_pk_sequence!('users')

1.upto(10) do |_i|
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Number.number(8)
  )
end

1.upto(10) do
  cat = Cat.create!(
    title: Faker::Artist.name,
    description: Faker::Lorem.questions(3),
    age: rand(1...8).to_i,
    price: rand(80..500).to_f
  )
  dl_cat_image = URI.parse(Faker::LoremFlickr.image).open
  cat.item_picture.attach(io: dl_cat_image, filename: 'cat_image.jpg', content_type: "image/jpeg")
end
