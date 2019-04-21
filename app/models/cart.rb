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
  has_many :cart_cats, dependent: :destroy

  validates :user_id, presence: true
  validates :status, presence: true
  validates :order_placed, presence: true, if: :status
end
