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

class CartCat < ApplicationRecord
  belongs_to :cart
  belongs_to :cat

  validates :cat_id, presence: true
  validates :cart_id, presence: true
  validates :quantity,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }

  def increment_quantity
    increment(:quantity)
  end

  def total_cat_price
    price * quantity
  end

  def include_cat_info
    Cat.find(cat_id)
  end

  delegate :item_picture, to: :include_cat_info
end
