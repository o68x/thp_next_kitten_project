# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id           :bigint(8)        not null, primary key
#  order_placed :datetime
#  status       :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint(8)
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :cart do
    user
    status { false }

    trait :with_cart_cats do
      after :create do |cart|
        create_list :cart_cat_without_picture, Random.rand(1..5), cart_id: cart.id
      end
    end

    trait :with_cart_cats_with_picture do
      after :create do |cart|
        create_list :cart_cat_with_picture, Random.rand(1..5), cart_id: cart.id
      end
    end

    trait :order_not_placed do
      order_placed { nil }
      status       { false }
    end

    trait :order_placed do
      order_placed { Faker::Date.backward(14) }
      status       { true }

      transient do
        cats_count { 3 }
      end

      after :create do |cart, evaluator|
        create_list :cart_cat_with_picture, evaluator.cats_count, cart: cart
      end
    end

    factory :cart_with_cart_cats, traits: %i[with_cart_cats]
    factory :cart_with_cart_cats_with_picture, traits: %i[with_cart_cats_with_picture]
  end
end
