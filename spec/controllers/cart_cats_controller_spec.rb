# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartCatsController, type: :controller do
  describe 'create cat' do
  end

  describe 'Delegation' do
    it { is_expected.to delegate_method(:current_cart).to(:current_user) }
  end
end
