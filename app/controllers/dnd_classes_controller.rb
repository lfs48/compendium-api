class DndClassesController < ApplicationController

    before_action :get_class_by_id, only: [:show, :update, :destroy]
    before_action :require_gm, only: [:create, :update, :destroy]

    def index
        @dndclasses = DndClass.includes(:features).all
        render "dnd_classes/index"
    end
    
    def show
        if @dndclass
            render "dnd_classes/show"
        else
            render json: { errors: [ "Class does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @dndclass = DndClass.new(dndclass_params)
        if @dndclass.save
            if (features_params[:features])
                begin
                    FeatureSource.update_source_features!(@dndclass, 'DndClass', features_params[:features])
                    @dndclass = DndClass.includes(:features).find_by(id: @dndclass.id)
                    render "dnd_classes/show", status: :created
                rescue => exception
                    puts exception
                    render json: { errors: { features: 'contains one or more invalid features' } }, status: :unprocessable_entity
                end
            else
                render "dnd_classes/show", status: :created
            end
        else
            @errors = @dndclass.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @dndclass.update(dndclass_params)
            if (features_params[:features])
                begin
                    FeatureSource.update_source_features!(@dndclass, 'DndClass', features_params[:features])
                    get_class_by_id
                    render "dnd_classes/show"
                rescue => exception
                    render json: { errors: { features: 'contains one or more invalid features' } }, status: :unprocessable_entity
                end
            else
                render "dnd_classes/show"
            end
        else
            @errors = @dndclass.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @dndclass.destroy
        render "dnd_classes/show"
    end

    private

    def dndclass_params
        params
        .require(:dndclass)
        .permit(
            :name, 
            :description, 
            :hp, 
            :armor,
            :weapons, 
            :defenses, 
            :skills, 
            { equipment: [] }, 
            :spellcasting, 
            { table_cols: {} }
        )
    end

    def features_params
        params
        .require(:dndclass)
        .permit(
            { features: [] }
        )
    end

    def get_class_by_id
        @dndclass = DndClass.includes(:features).find_by(id: params[:id])
    end

end