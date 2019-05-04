# frozen_string_literal: true

require 'rails_helper'

describe "User visits homepage", type: :feature do
  let(:user) { create(:user) }

  it "when logged in" do
    login_as user
    visit root_path

    expect(page).to have_link "Sign out", href: destroy_user_session_path
  end

  it "when not logged in" do
    logout
    visit root_path

    expect(page).to have_link "Log in", href: new_user_session_path
  end
end
