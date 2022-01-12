json.feature do
    json.extract! feature, 
    :id, 
    :name,
    :description, 
    :kind,
    :category

    json.sources do
        json.array! feature.feature_sources do |source|
            json.extract! source,
            :id,
            :source_type,
            :level
        end
    end
end