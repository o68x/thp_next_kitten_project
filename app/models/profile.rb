# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint(8)        not null, primary key
#  address      :string
#  city         :string
#  country      :string
#  description  :text
#  first_name   :string
#  last_name    :string
#  phone_number :integer
#  zip_code     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint(8)
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture # active storage

  def avatar
    if profile_picture.attached?
      profile_picture
    else
      "profile_nil.png"
    end
  end

end
