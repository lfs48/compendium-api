class AuthsController < ApplicationController
  
    def login
      @user = User.authenticate( user_params[:username], user_params[:password] )
      if @user
        @token = token(@user.id)
        render "auth/show", status: :ok
      else 
        render json: { errors: [ "Incorrect username or password" ] }, status: :unprocessable_entity
      end 
    end

    def register
      @user = User.new(user_params)
      if @user.save
          @token = token(@user.id)
          render "auth/show", status: :created
      else
          render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end
  
    private 
    def user_params
      params.require(:user).permit(:username, :password)
    end

  end