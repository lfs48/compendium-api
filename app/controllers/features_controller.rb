class FeaturesController < ApplicationController

    before_action :get_feature_by_id, only: [:show, :update, :destroy, :create_source, :destroy_source]
    before_action :require_auth, only: [:create, :update]

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
        render "features/show"
    end

    def create_source
        @feature_source = FeatureSource.new(feature_source_params)
        @feature_source.feature_id = @feature.id
        if @feature_source.save
            get_feature_by_id
            render "features/show"
        else
            @errors = @feature_source.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy_source

    end

    private

    def feature_params
        params
        .require(:feature)
        .permit(
            :name, 
            :description, 
            :kind,
            :category
        )
    end

    def get_feature_by_id
        @feature = Feature..includes(:feature_sources).find_by(id: params[:id])
    end

    def feature_source_params
        params
        .require(:feature_source)
        .permit(
            :source_id,
            :source_type,
            :level
        )
    end

end