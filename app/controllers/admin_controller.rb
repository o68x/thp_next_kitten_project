# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :require_admin

  def require_admin
    if current_user.is_admin?
    else
      flash[:error] = "You must be admin to access"
      redirect_to root_path
    end
  end
end
