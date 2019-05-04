# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[create show edit update]

  def show; end

  def create
    @profile.new(params_profile)
    redirect_to(edit_profile_path(@profile.id)) if @profile.save
  end

  def edit; end

  def update
    @profile.update(params_profile)
    redirect_to(edit_profile_path(@profile.id)) if @profile.update
  end

  private

  def set_profile
    @profile = current_user.profile.id
  end

  def resource_name; end

  def params_profile
    params.require(:profile).permit(:profile_picture)
  end
end
