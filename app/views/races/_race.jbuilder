json.extract! race, 
    :id, 
    :name, 
    :description, 
    :size,
    :creature_type
    
json.features race.feature_sources.map { |feature_source| feature_source.feature_id }