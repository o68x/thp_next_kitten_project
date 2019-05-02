# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :index_if_signed_in

  def index; end

  private

  def index_if_signed_in
    redirect_to cats_path if user_signed_in?
  end
end
