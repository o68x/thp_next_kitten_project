# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_cats
#
#  id         :bigint(8)        not null, primary key
#  price      :decimal(5, 2)
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint(8)
#  cat_id     :bigint(8)
#
# Indexes
#
#  index_cart_cats_on_cart_id  (cart_id)
#  index_cart_cats_on_cat_id   (cat_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (cat_id => cats.id)
#

FactoryBot.define do
  factory :cart_cat do
    quantity { Faker::Number.between(1, 3) }
    price    { Faker::Number.between(10, 100) }
  end
end
