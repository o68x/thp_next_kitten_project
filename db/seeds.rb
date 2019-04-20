# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroy database.."
sleep(1)
Cat.destroy_all

sleep(1)
puts "Reset PK Sequence"
ActiveRecord::Base.connection.reset_pk_sequence!('cats')

1.upto(10) do |i|
    Cat.create!(
        title: Faker::Artist.name,
        description: Faker::Lorem.questions(3),
        age: rand(1...8).to_i,
        price: rand(80..500).to_f
    )
    p "CAT #{i} : créé"
end

