# frozen_string_literal: true

module Admin
  class UsersController < AdminController
    def index
        @users = User.all
    end
    def show
        
    end
    def delete
        
    end



  end
end
