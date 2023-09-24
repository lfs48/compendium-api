json.extract! dndclass, 
    :id, 
    :name, 
    :description, 
    :hp, 
    :armor, 
    :weapons, 
    :defenses, 
    :skills, 
    :equipment, 
    :spellcasting, 
    :table_cols
    
json.features dndclass.feature_sources.map { |feature_source| feature_source.feature_id }