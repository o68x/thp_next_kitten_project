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

class Cat < ApplicationRecord
  validates :title, :price, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. " }
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed. " }
  validates :price, length: { maximum: 6 }
  has_one_attached :item_picture # active storage
  belongs_to :seller, class_name: 'User'
end
