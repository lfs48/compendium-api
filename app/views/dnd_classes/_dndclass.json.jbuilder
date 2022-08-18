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
    
json.features do
    json.array! dndclass.feature_sources do |feature_source|
            json.id feature_source.feature_id
            json.level feature_source.level
    end
end