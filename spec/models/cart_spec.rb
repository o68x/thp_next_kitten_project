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

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'Model instantiation' do
    subject(:new_cart) { described_class.new }
  end

  describe 'records' do
    describe 'associations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:cart_cats) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:user_id) }
      it { is_expected.to validate_inclusion_of(:status).in_array([true, false]) }
      xit('#TODO: conditional validation of presence?') { is_expected.to validate_presence_of(:order_placed) }
    end
  end
end
