# frozen_string_literal: true

# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  age         :integer
#  description :text
#  image       :text
#  price       :decimal(4, 2)    default(0.0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#
# Indexes
#
#  index_cats_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Cat < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, :age, :price, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed. " }
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed. " }
  validates :price, length: { maximum: 6 }
end
