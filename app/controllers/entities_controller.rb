class EntitiesController < ApplicationController

    def index
        @dndclasses = DndClass.includes(:features).all
        @features = Feature.includes(:feature_sources).all
        @races = Race.includes(:features).all
        @items = Item.all
        @spells = Spell.all
        render "entities/index"
    end

end