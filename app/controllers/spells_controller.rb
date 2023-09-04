class SpellsController < ApplicationController

    before_action :get_spell_by_id, only: [:show, :update, :destroy]
    before_action :require_gm, only: [:create, :update, :destroy]

    def index
        @spells = Spell.all
        render "spells/index"
    end

    def show
        if @spell
            render "spells/show"
        else
            render json: { errors: [ "Spell does not exist" ] }, status: :unprocessable_entity
        end
    end

    def create
        @spell = Spell.new(spell_params)
        if @spell.save
            render "spells/show", status: :created
        else
            @errors = @spell.errors
            render "errors/show", status: :unprocessable_entity
        end
    end

    def update
        if @spell.update(spell_params)
            render "spells/show"
        else
            @errors = @spell.errors.full_messages
            render "errors/show", status: :unprocessable_entity
        end
    end

    def destroy
        @spell.destroy
        render "spells/show"
    end

    private

    def spell_params
        params
        .require(:spell)
        .permit(
            :name, 
            :description, 
            :rank,
            :material,
            :concentration,
            :duration,
            :range,
            :targets,
            :casting_time,
            { upcast: [] },
            { aspects: [] },
            { dnd_class_ids: [] }
        )
    end

    def get_spell_by_id
        @spell = Spell.includes(:dnd_classes).find_by(id: params[:id])
    end

end