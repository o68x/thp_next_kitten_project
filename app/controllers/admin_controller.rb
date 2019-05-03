# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :require_admin

  def index_admin; end

  def require_admin
    unless current_user.try(:is_admin?)
      flash[:error] = "You must be admin to access"
      redirect_to root_path
    end
  end
end
