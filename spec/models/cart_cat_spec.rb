# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_cats
#
#  id         :bigint(8)        not null, primary key
#  price      :decimal(5, 2)
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint(8)
#  cat_id     :bigint(8)
#
# Indexes
#
#  index_cart_cats_on_cart_id  (cart_id)
#  index_cart_cats_on_cat_id   (cat_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (cat_id => cats.id)
#

require 'rails_helper'

RSpec.describe CartCat, type: :model do
  it 'has a valid Factory' do
    expect(build(:cart_cat)).to be_valid
  end

  describe 'records' do
    describe 'associations' do
      it { is_expected.to belong_to(:cart) }
      it { is_expected.to belong_to(:cat) }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of(:cat_id) }
      it { is_expected.to validate_presence_of(:cart_id) }
    end
  end

  describe '#increment_quantity' do
    it 'increments the quantity by 1' do
      subject { build :cart_cat, quantity: 1 }

      subject.increment_quantity
      expect(subject.quantity).to eq(2)
    end
  end
end 
