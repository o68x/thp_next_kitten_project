# frozen_string_literal: true

require 'rails_helper'

describe "Homepage", type: :feature do
  let(:user) { create(:user) }

  it "user logged in" do
    login_as user
    visit root_path

    expect(page).to have_current_path cats_path
  end

  it "user not logged in" do
    logout
    visit root_path

    expect(page).to have_current_path root_path
  end
end
