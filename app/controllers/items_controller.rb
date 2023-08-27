class ItemsController < ApplicationController

    before_action :get_item_by_id, only: [:show, :update, :destroy]
    before_action :require_gm, only: [:create, :update, :destroy]

    def index
        @items = Item.all
        render "items/index"
    end

    def show
        if @item
            render "items/show"
        else
            render json: { errors: [ "Item does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            render "items/show", status: :created
        else
            @errors = @item.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @item.update(item_params)
            render "items/show"
        else
            @errors = @item.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @item.destroy
        render "items/show"
    end

    private

    def item_params
        params
        .require(:item)
        .permit(
            :name, 
            :description, 
            :kind,
            :rarity,
            :magic,
            :bulk,
            :value
        )
    end

    def get_item_by_id
        @item = Item.find_by(id: params[:id])
    end

end