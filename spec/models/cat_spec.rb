# frozen_string_literal: true

# == Schema Information
#
# Table name: cats
#
#  id           :bigint(8)        not null, primary key
#  age          :integer
#  description  :text
#  image        :text
#  is_available :boolean          default(TRUE)
#  price        :decimal(, )      default(0.0)
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  seller_id    :bigint(8)
#
# Indexes
#
#  index_cats_on_seller_id  (seller_id)
#

require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe 'Model instantiation' do
    subject(:new_cat) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:age).of_type(:integer) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:image).of_type(:text) }
      it { is_expected.to have_db_column(:price).of_type(:decimal).with_options(null: true) }
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end
end
