json.extract! col, 
    :id, 
    :title

json.entities do
    json.array! col.collection_entities do |collection_entity|
        json.id collection_entity.entity_id
        json.entity_type collection_entity.entity_type
    end
end