json.dndclass do
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
    :table_cols, 
    :subclass_title, 
    :subclass_feature_levels
    
    json.features do
        json.array! dndclass.feature_sources do |feature|
            json.extract! feature,
            :id,
            :level
        end
    end
end