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

    validates :level, numericality: {
        allow_nil: true,
        only_integer: true,
        greater_than: 0,
        less_than_or_equal_to: 20
    }

    belongs_to :feature

    belongs_to :source, 
    polymorphic: true

    def self.update_feature_sources!(source, source_type, new_features)
        old_features = source.features
        old_feature_ids = old_features.map { |feature| feature.id }
        new_feature_ids = new_features.map { |feature| feature[:id] }  
        removed_feature_ids = old_feature_ids.reject { |id| new_feature_ids.include?(id) }
        added_features = new_features.reject { |feature| old_feature_ids.include?(feature[:id]) }
        removed_feature_sources = FeatureSource.where(source_id: source.id, feature_id: removed_feature_ids)
        FeatureSource.transaction do
            removed_feature_sources.each do |feature_source|
                feature_source.destroy!
            end

            added_features.each do |feature|
                feature_source = FeatureSource.new({
                    source_id: source.id,
                    feature_id: feature[:id],
                    source_type: source_type,
                    level: feature[:level]
                })
                feature_source.save!
            end
        end
    end
    

end