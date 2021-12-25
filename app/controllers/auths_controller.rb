class AuthsController < ApplicationController
  
    def create
      @user = User.authenticate( user_params[:username], user_params[:password] )
      if @user
        @token = token(@user.id)
        render "auth/show"
      else 
        render json: { errors: [ "Incorrect username or password" ] }, status: :unprocessable_entity
      end 
    end
  
    private 
    def user_params
      params.require(:user).permit(:username, :password)
    end

  end