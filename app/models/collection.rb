class Collection < ApplicationRecord

    validates :title,
    presence: true

    belongs_to :user

    has_many :collection_entities, 
    dependent: :delete_all

    has_many :dndclasses, 
    through: :collection_entities,
    source: :entity,
    source_type: 'DndClass'

    has_many :races, 
    through: :collection_entities,
    source: :entity,
    source_type: 'Race'

    has_many :features, 
    through: :collection_entities,
    source: :entity,
    source_type: 'Feature'

    has_many :spells, 
    through: :collection_entities,
    source: :entity,
    source_type: 'Spell'

    has_many :items, 
    through: :collection_entities,
    source: :entity,
    source_type: 'Item'

    def entities
        all_entities = []
        all_entities += self.dndclasses
        all_entities += self.races
        all_entities += self.features
        all_entities += self.spells
        all_entities += self.items
        return all_entities
    end

end