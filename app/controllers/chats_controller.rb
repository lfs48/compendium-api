class ChatsController < ApplicationController

    before_action :require_auth

    def index
      @chats = Chat.includes(:messages).all
    end
  end
  