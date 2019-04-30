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
  let(:not_ordered_cart) { create(:cart, :order_not_placed) }
  let(:ordered_cart) { create(:cart, :order_placed) }
  let(:cart) { create(:cart) }

  it "has a valid factory" do
    expect(create(:cart)).to be_valid
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
          pending("#TODO: That's not gonna work")
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
    it 'returns the total price of cats' do
      create(:cart)
      cat1 = create(:cat)
      cat2 = create(:cat)
      create(:cart_cat, cart_id: cart.id, cat_id: cat1.id, price: 10, quantity: 1)
      create(:cart_cat, cart_id: cart.id, cat_id: cat2.id, price: 10, quantity: 2)

      expect(cart.total_cart_price).to eq(30)
    end

    describe '#zipfile' do
      it 'returns a non empty object' do
        pending("#TODO: Should build the whole stuff, including attachments")
        create(:cart)
        cat1 = create(:cat)
        cat2 = create(:cat)
        create(:cart_cat, cart_id: cart.id, cat_id: cat1.id, price: 10, quantity: 1)
        create(:cart_cat, cart_id: cart.id, cat_id: cat2.id, price: 10, quantity: 2)

        expect(cart.zipfile).not_to be_empty
      end
    end
  end
end
