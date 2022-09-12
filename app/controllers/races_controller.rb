class RacesController < ApplicationController

    before_action :get_race_by_id, only: [:show, :update, :destroy]
    before_action :require_gm, only: [:create, :update, :destroy]

    def index
        @races = Race.includes(:features).all
        render "races/index"
    end
    
    def show
        if @race
            render "races/show"
        else
            render json: { errors: [ "Race does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @race = Race.new(race_params)
        if @race.save
            if (features_params[:features])
                begin
                    FeatureSource.update_feature_sources!(@race, 'Race', features_params[:features])
                    @race = Race.includes(:features).find_by(id: @race.id)
                    render "races/show", status: :created
                rescue => exception
                    puts exception
                    render json: { errors: { features: 'contains one or more invalid features' } }, status: :unprocessable_entity
                end
            else
                render "races/show", status: :created
            end
        else
            @errors = @race.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @race.update(race_params)
            if (features_params[:features])
                begin
                    FeatureSource.update_feature_sources!(@race, 'Race', features_params[:features])
                    get_race_by_id
                    render "races/show"
                rescue => exception
                    render json: { errors: { features: 'contains one or more invalid features' } }, status: :unprocessable_entity
                end
            else
                render "races/show"
            end
        else
            @errors = @race.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @race.destroy
        render "races/show"
    end

    private

    def race_params
        params
        .require(:race)
        .permit(
            :name, 
            :description
        )
    end

    def features_params
        params
        .require(:race)
        .permit(
            { features: [] }
        )
    end

    def get_race_by_id
        @race = Race.includes(:features, :boons).find_by(id: params[:id])
    end

end