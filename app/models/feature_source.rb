class FeatureSource < ApplicationRecord

    validates :source_id,
    :feature_id,
    :source_type,
    presence: true

    validates :source_type, 
    inclusion: { 
        in: [
            "DndClass"
        ], 
        message: "must be one of: DndClass"
    }

    belongs_to :feature

    belongs_to :source, 
    polymorphic: true

    def self.update_feature_sources!(source, source_type, new_features)
        old_features = source.features.map { |feature| feature.id }
        removed_features = old_features.reject { |id| new_features.include?(id) }
        added_features = new_features.reject { |id| old_features.include?(id) }
        removed_feature_sources = FeatureSource.where(source_id: source.id, feature_id: removed_features)
        FeatureSource.transaction do
            removed_feature_sources.each do |feature_source|
                feature_source.destroy!
            end

            added_features.each do |id|
                feature_source = FeatureSource.new({
                    source_id: source.id,
                    feature_id: id,
                    source_type: source_type
                })
                feature_source.save!
            end
        end
    end
    

end