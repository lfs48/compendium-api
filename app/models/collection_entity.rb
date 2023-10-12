class CollectionEntity < ApplicationRecord

    validates :collection_id,
    :entity_id,
    :entity_type,
    presence: true

    validates :entity_type, 
    inclusion: { 
        in: [
            "DndClass",
            "Race",
            "Feature",
            "Spell",
            "Item"
        ], 
        message: "must be one of: DndClass, Race, Feature, Spell, Item"
    }

    belongs_to :collection

    belongs_to :entity,
    polymorphic: true

    def self.update_collection_entities!(collection, new_entities)
        new_entity_ids = new_entities.map { |entity| entity[:id] }
        old_entity_ids = collection.entities.map { |entity| entity.id }
        removed_entity_ids = old_entity_ids.reject { |id| new_entity_ids.include?(id) }
        added_entities = new_entities.reject { |entity| old_entity_ids.include?(entity[:id]) }
        added_entity_ids = added_entities.map { |entity| entity[:id] }
        removed_collection_entities = CollectionEntity.where(entity_id: removed_entity_ids, collection_id: collection.id)
        CollectionEntity.transaction do
            removed_collection_entities.each do |collection_entity|
                collection_entity.destroy!
            end

            added_entities.each do |entity|
                collection_entity = CollectionEntity.new({
                    entity_id: entity[:id],
                    collection_id: collection.id,
                    entity_type: entity[:entity_type]
                })
                collection_entity.save!
            end
        end
    end
    

end