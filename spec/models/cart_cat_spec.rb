# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_cats
#
#  id         :bigint(8)        not null, primary key
#  price      :decimal(5, 2)
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
end
