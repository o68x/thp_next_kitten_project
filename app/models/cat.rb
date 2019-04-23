# frozen_string_literal: true

# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  age         :integer
#  description :text
#  image       :text
#  price       :decimal(, )      default(0.0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :title, :age, :price, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. " }
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed. " }
  validates :price, length: { maximum: 6 }
  has_one_attached :item_picture #active storage
end
