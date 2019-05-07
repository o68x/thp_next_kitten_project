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
    @profile = Profile.find(params[:id])
    profile_params = params.permit(:descrition, :phone_number, :profile_picture)

    if !params[:profile_picture].nil?
      @profile.profile_picture.attach(params[:profile_picture])
    end

    if @profile.update(profile_params)
      redirect_to edit_profile_path, flash: { success: "Profile updated" }
    else
      render 'index'
    end
  end

  private

  def set_profile
    @profile = current_user.profile.id
  end

  def resource_name; end
end
