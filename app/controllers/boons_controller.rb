class BoonsController < ApplicationController

    before_action :get_boon_by_id, only: [:show, :update, :destroy]
    before_action :require_gm, only: [:create, :update, :destroy]

    def index
        @boons = Boon.all
        render "boons/index"
    end

    def show
        if @boon
            render "boons/show"
        else
            render json: { errors: [ "Boon does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @boon = Boon.new(boon_params)
        if @boon.save
            render "boons/show", status: :created
        else
            @errors = @boon.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @boon.update(boon_params)
            render "boons/show"
        else
            @errors = @boon.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @boon.destroy
        render "boons/show"
    end

    private

    def boon_params
        params
        .require(:boon)
        .permit(
            :name, 
            :description,
            :prereq,
            :source_id,
            :source_type
        )
    end

    def get_boon_by_id
        @boon = Boon.includes(:source).find_by(id: params[:id])
    end

end