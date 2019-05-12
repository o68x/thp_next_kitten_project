# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CartCatsHelper. For example:
#
# describe CartCatsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CartCatsHelper, type: :helper do
  let(:cart_cat) { create(:cart_cat) }

  describe '#cat_data_for_seller' do
    it 'returns an array' do
      expect(helper.cat_data_for_seller(cart_cat)).to be_instance_of Array
    end
    it 'returns an array of hashes' do
      pending("#TODO: RSPEC method needs to be refactored to be tested ;)")
      expect(helper.cat_data_for_seller(cart_cat)[0]).to be_instance_of Hash
    end
  end
end
