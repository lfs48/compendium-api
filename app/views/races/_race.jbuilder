json.extract! race, 
    :id, 
    :name, 
    :description
    
json.features race.feature_sources.map { |feature_source| feature_source.feature_id }

json.boons race.boons.map { |boon| boon.id }