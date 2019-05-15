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
  let(:cart) { create(:cart) }
  let(:ordered_cart) { create(:cart, :order_placed) }
  let(:not_ordered_cart) { create(:cart, :order_not_placed) }

  it "has a valid factory" do
    expect(create(:cart)).to be_valid
    expect(create(:cart_with_cart_cats)).to be_valid
    expect(create(:cart_with_cart_cats_with_picture)).to be_valid
  end

  it "has a valid factory with cart_cats" do
    expect(create(:cart, :order_placed)).to be_valid
  end

  describe 'ActiveRecord' do
    describe 'Associations' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to have_many(:cart_cats) }
    end

    describe 'Validations' do
      it { is_expected.to validate_presence_of(:user_id) }
      context 'when status is true (ordered)' do
        it 'validates the presence of order_placed date' do
          pending("#TODO: RSPEC That's not gonna work")
          subject { build(:cart, status: false) }
          expect(subject).to validate_presence_of(:order_placed)
        end
      end
    end
  end

  describe '#status' do
    it { expect(cart.status).to be_in [true, false] }

    context 'when nil (not ordered)' do
      it "order_placed is nil" do
        subject { :not_ordered_cart }

        expect(not_ordered_cart.order_placed).to be_nil
      end
    end

    context 'when true (ordered)' do
      it 'order_placed is datetime' do
        subject { :ordered_cart }

        expect(ordered_cart.order_placed).to be_instance_of ActiveSupport::TimeWithZone
      end
    end
  end

  describe '#cart_user' do
    it { expect(cart.cart_user).to be_instance_of(User) }
  end

  describe '#total_cart_price' do
  end

  describe '#zipfile' do
    let(:cart) { create(:cart_with_cart_cats_with_picture) }

    it 'returns a non empty object' do
      pending("#TODO: create factory with attachments")

      expect(cart.zipfile).not_to be_empty
    end
  end
end
