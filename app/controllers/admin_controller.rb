# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :require_admin

  def index_admin; end

  def require_admin
    redirect_to root_path unless current_user.try(:is_admin?)
  end
end
