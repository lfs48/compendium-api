class UsersController < ApplicationController

    before_action :require_auth, only: [:show]
    
    def create
        @user = User.new(user_params)
        if @user.save
            render "users/show", status: :created
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render "users/show"
        else
            render json: { errors: [ "User does not exist" ] }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end