# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  is_admin               :boolean          default(FALSE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :user, aliases: [:seller] do
    email    { Faker::Internet.unique.safe_email }
    password { Faker::Internet.password }

    trait :with_cats do
      transient do
        cats_count { 3 }
      end

      after :create do |user, evaluator|
        create_list :cat, evaluator.cats_count, seller: user
      end
    end

    factory :seller_with_cats, traits: %i[with_cats]
  end
end
