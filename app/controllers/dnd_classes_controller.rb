class DndClassesController < ApplicationController

    before_action :get_class_by_id, only: [:show, :update, :destroy]
    before_action :require_auth, only: [:create, :update]

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
            render "dnd_classes/show", status: :created
        else
            @errors = @dndclass.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @dndclass.update(dndclass_params)
            render "dnd_classes/show"
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
            :hitdie, 
            :armor, 
            :weapons, 
            :tools, 
            :saves, 
            :skills, 
            { equipment: [] }, 
            :spellcasting, 
            { table_cols: {} }, 
            :subclass_title, 
            {subclass_feature_levels: [] },
            {features: [] }
        )
    end

    def get_class_by_id
        @dndclass = DndClass.includes(:features).find_by(id: params[:id])
    end

end