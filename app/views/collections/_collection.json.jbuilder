json.extract! col, 
    :id, 
    :title

json.entities do
    json.array! col.collection_entities do |entity|
        json.id entity.id
        json.entity_type entity.entity_type
    end
end