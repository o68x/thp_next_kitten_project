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

FactoryBot.define do
  factory :cat do
  end
end
