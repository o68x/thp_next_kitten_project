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

FactoryBot.define do
  factory :cat do
  end
end
