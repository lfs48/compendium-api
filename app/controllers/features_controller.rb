class FeaturesController < ApplicationController

    before_action :get_feature_by_id, only: [:show, :update, :destroy]
    before_action :require_auth, only: [:create, :update]

    def show
        if @feature
            render "features/show"
        else
            render json: { errors: [ "Feature does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @feature = Feature.new(feature_params)
        if @feature.save
            render "features/show", status: :created
        else
            @errors = @feature.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @feature.update(feature_params)
            render "features/show"
        else
            @errors = @feature.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @feature.destroy
    end

    private

    def feature_params
        params
        .require(:feature)
        .permit(
            :name, 
            :description, 
            :type,
            :category
        )
    end

    def get_feature_by_id
        @feature = Feature.find_by(id: params[:id])
    end

end