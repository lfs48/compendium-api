json.extract! dndclass, 
    :id, 
    :name, 
    :description, 
    :hitdie, 
    :armor, 
    :weapons, 
    :tools, 
    :saves, 
    :skills, 
    :equipment, 
    :spellcasting, 
    :table_cols
    
json.features dndclass.feature_sources.map { |feature_source| feature_source.feature_id }

json.spells dndclass.spells.map { |spell| spell.id }