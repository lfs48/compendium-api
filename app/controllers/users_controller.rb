class UsersController < ApplicationController

    before_action :get_user_by_id
    before_action :require_auth, only: [:show]
    before_action :require_self, only: [:update]

    def show
        if @user
            render "users/show"
        else
            render json: { errors: [ "User does not exist" ] }, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(user_params)
            render "users/show"
        else
            @errors = @user.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :color)
    end

    def get_user_by_id
        @user = User.find_by(id: params[:id])
    end

    def require_self
        render json: {error: 'Unauthorized'}, status: :unauthorized unless @user.id == current_user_id
    end

end