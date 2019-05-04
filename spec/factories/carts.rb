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

    trait :order_not_placed do
      order_placed { nil }
      status       { false }
    end

    trait :order_placed do
      # TODO: RSPEC Create cart_cats for factory?
      after :create do |cart|
        create_list :cart_cat, Random.rand(1..3), cart_id: cart.id
      end

      order_placed { Faker::Date.backward(14) }
      status       { true }
    end
  end
end
