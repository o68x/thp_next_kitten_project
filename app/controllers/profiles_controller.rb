class ProfilesController < ApplicationController
    def create
        @profile = Profile.find(params[:profile_id])
        @profile.profile_picture.attach(params[:profile_picture])
        redirect_to(profile_path(@profile))
    end
end

