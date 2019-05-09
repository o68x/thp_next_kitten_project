# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartCatsController, type: :controller do
  describe 'Delegation' do
    it { is_expected.to delegate_method(:current_cart).to(:current_user) }
  end

  describe '#create' do
    before { sign_in create(:user) }

    let(:cart_cat) { build(:cart_cat, quantity: 1) }

    context 'when user signed in' do
      context 'when item already in cart' do
        it "increments count of this item" do
          cart_cat.increment_quantity

          expect(cart_cat.quantity).to eq(2)
        end
      end

      context 'when item not already in cart' do
        it 'should create a new item in cart'
      end

      it 'saves the valid new/updated item in cart' do
        build(:cart_cat)

        expect { cart_cat.save }.to change(CartCat, :count)
      end
    end

    context 'when user not signed in' do
      before do
        sign_out :user
        get :create
      end

      it { is_expected.to redirect_to new_user_session_path }
      it { is_expected.to set_flash[:alert] }
    end

    xit 'TODO: what to test?' do
      sign_in user
    end
  end
end
