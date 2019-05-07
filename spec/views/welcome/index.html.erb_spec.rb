# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "welcome/index.html.erb", type: :view do
  let(:user) { create(:user) }

  context "when user is logged in" do
    it "redirects to cats#index" do
      pending "#TODO: is this a view test?"
      login_as user
      render

      expect(rendered).to redirect_to cats_path
    end
  end

  context "when user is not logged in" do
    xit "shows the landing page" do
      logout
      render

      expect(rendered).to render root_path
    end
  end
end
