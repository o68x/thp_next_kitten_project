# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
ActionMailer::Base.perform_deliveries = false

sleep(1)
puts "Destroying previous records"
User.destroy_all
Cat.destroy_all
Cart.destroy_all
CartCat.destroy_all
Profile.destroy_all

sleep(1)
puts "Resetting sequence"
ActiveRecord::Base.connection.reset_pk_sequence!('cats')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('carts')
ActiveRecord::Base.connection.reset_pk_sequence!('cart_cats')
ActiveRecord::Base.connection.reset_pk_sequence!('profiles')

(1..10).to_a.each do |i|
  puts "Creating User #{i}"
  User.create!(
    email: "#{Faker::Internet.unique.username}@yopmail.com",
    password: "password"
  )
end

(1..10).to_a.each do |i|
  puts "Profile update #{i}"

  Profile.find(i).update(
    description: Faker::ChuckNorris.fact,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_id: i.to_s
  )
end

(1..10).to_a.each do |i|
  puts "Creating Cat #{i}"
  cat = Cat.create!(
    title: Faker::Artist.name,
    description: Faker::Lorem.questions(3).join(" "),
    price: rand(80..500).to_f,
    seller_id: i.to_s
  )
  dl_cat_image = URI.parse(Faker::LoremFlickr.image).open
  cat.item_picture.attach(io: dl_cat_image, filename: 'cat_image.jpg', content_type: "image/jpeg")
end

(1..5).to_a.each do |i|
  puts "Creating closed (ordered) Cart #{i}"
  Cart.find(i).update!(
    status: true,
    order_placed: Faker::Date.backward(30)
  )
  j = 1
  rand(1..3).times do
    cat = Cat.find(j)
    CartCat.create!(
      cart_id: i,
      cat_id: cat.id,
      price: cat.price,
      quantity: rand(1..2)
    )
    j += 1
    Cart.create!(
      user_id: Cart.find(i).user_id
    )
  end
end
