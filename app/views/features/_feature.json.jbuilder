json.ignore_nil! true
json.extract! feature, 
    :id, 
    :name,
    :description,
    :level,
    :kind,
    :prereq

json.sources do
    json.array! feature.feature_sources do |feature_source|
        json.id feature_source.source_id
        json.source_type feature_source.source_type
    end
end