class MessagesController < ApplicationController

    before_action :get_message_by_id, only: [:show]

    before_action :require_auth, only: [:create]

    def index
        @messages = Message.includes(:user).order(created_at: :desc).page params[:page]
        render "messages/index"
    end

    def show
        if @message
            render "messages/show"
        else
            render json: { errors: [ "message does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @message = Message.new(message_params)
        if @message.save
            render "messages/show", status: :created
        else
            @errors = @message.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    private

    def message_params
        params
        .require(:message)
        .permit(
            :body,
            :kind,
            :user_id
        )
    end

    def get_message_by_id
        @message = Message.find_by(id: params[:id])
    end

end