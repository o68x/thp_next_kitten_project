# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint(8)        not null, primary key
#  address      :string
#  description  :text
#  phone_number :integer
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

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'Model instantiation' do
    subject(:new_profile) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:address).of_type(:string).with_options(null: true) }
      it { is_expected.to have_db_column(:description).of_type(:text).with_options(null: true) }
      it { is_expected.to have_db_column(:phone_number).of_type(:integer).with_options(null: true) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end
end
