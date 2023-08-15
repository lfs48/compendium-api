class FeaturesController < ApplicationController

    before_action :get_feature_by_id, only: [:show, :update, :destroy]
    before_action :require_gm, only: [:create, :update, :destroy]

    def index
        @features = Feature.includes(:feature_sources).all
        render "features/index"
    end

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
            FeatureSource.update_feature_sources!(@feature, source_params[:sources])
            @feature = Feature.find_by(id: @feature.id)
            render "features/show", status: :created
        else
            @errors = @feature.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @feature.update(feature_params)
            FeatureSource.update_feature_sources!(@feature, source_params[:sources])
            get_feature_by_id
            render "features/show"
        else
            @errors = @feature.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @feature.destroy
        render "features/show"
    end

    private

    def feature_params
        params
        .require(:feature)
        .permit(
            :name, 
            :description,
            :level,
            :kind,
            :prereq
        )
    end

    def source_params
        params
        .require(:feature)
        .permit(
            {sources: [:id, :source_type]}
        )
    end

    def get_feature_by_id
        @feature = Feature.includes(:feature_sources).find_by(id: params[:id])
    end

end