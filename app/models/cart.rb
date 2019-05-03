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

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_cats, -> { includes :cat }, inverse_of: :cart, dependent: :destroy

  validates :user_id, presence: true
  validates :status, inclusion: { in: [true, false] }
  validates :order_placed, presence: true, if: :status

  def cart_user
    User.find(user_id)
  end

  def total_cart_price
    # cart_cats.map(&:total_cat_price).sum
    CartCat.where(cart_id: id).select(:price, :quantity).map { |c| c.price * c.quantity }.sum
  end

  def total_cart_price_in_cents
    total_cart_price * 100
  end

  def count_cats
    CartCat.where(cart_id: id).select(:quantity).map { |q| q[:quantity] }.sum
  end

  def list_cat_names
    CartCat.where(cart_id: id).map { |c| c.cat.title }
  end

  def zipfile
    ZipCartContent.perform(cart: id)
  end
end
