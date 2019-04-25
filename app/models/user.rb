# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_profile, :create_cart

  has_one  :profile, dependent: :destroy
  has_many :carts, dependent: :destroy

  validates :encrypted_password, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  # This is a devise helper methode
  def after_database_authentication
    set_current_cart
  end

  def current_cart
    carts.find_by(status: false)
  end

  def set_current_cart
    # create a new cart if none open (e.g. status = 0)
    carts.find_by(status: false) || create_cart
  end

  private

  def create_cart
    carts.create!
  end
end
