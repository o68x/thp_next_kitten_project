# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
        @users = User.all
    end
    def show
        
    end
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path
        
    end



  end
end
