# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartCatsController, type: :controller do
  describe 'Delegation' do
    it { is_expected.to delegate_method(:current_cart).to(:current_user) }
  end

  # Probably better off with view tests?
  describe '#create' do
    xit 'TODO: what to test?' do
      sign_in user
    end
  end
end
