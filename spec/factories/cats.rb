# frozen_string_literal: true

# == Schema Information
#
# Table name: cats
#
#  id           :bigint(8)        not null, primary key
#  description  :text
#  image        :text
#  is_available :boolean          default(TRUE)
#  price        :decimal(, )      default(0.0)
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  seller_id    :bigint(8)
#
# Indexes
#
#  index_cats_on_seller_id  (seller_id)
#

FactoryBot.define do
  factory :cat do
    title       { Faker::Artist.name }
    description { Faker::Lorem.sentences(3).join(" ") }
    age         { rand(1..8).to_i }
    price       { rand(80..500).to_f }

    trait :with_picture do
      after :create do |cat|
        file_path = Rails.root.join('spec', 'support', 'assets', 'test-picture.jpg')
        file = Rack::Test::UploadedFile.new(file_path, 'image/jpg')
        cat.item_picture.attach(file)
      end
    end

    factory :cat_with_picture, traits: %i[with_picture]
    factory :cat_without_picture
  end
end
