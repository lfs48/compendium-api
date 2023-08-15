class FeatureSource < ApplicationRecord

    validates :source_id,
    :feature_id,
    :source_type,
    presence: true

    validates :source_type, 
    inclusion: { 
        in: [
            "DndClass",
            "Race"
        ], 
        message: "must be one of: DndClass, Race"
    }

    belongs_to :feature

    belongs_to :source, 
    polymorphic: true

    def self.update_source_features!(source, source_type, new_features)
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

    def self.update_feature_sources!(feature, new_sources)
        new_source_ids = new_sources.map { |source| source[:id] }
        old_source_ids = feature.sources.map { |source| source.id }
        removed_source_ids = old_source_ids.reject { |id| new_source_ids.include?(id) }
        added_sources = new_sources.reject { |source| old_source_ids.include?(source[:id]) }
        added_source_ids = added_sources.map { |source| source[:id] }
        removed_feature_sources = FeatureSource.where(source_id: removed_source_ids, feature_id: feature.id)
        FeatureSource.transaction do
            removed_feature_sources.each do |feature_source|
                feature_source.destroy!
            end

            added_sources.each do |source|
                feature_source = FeatureSource.new({
                    source_id: source[:id],
                    feature_id: feature.id,
                    source_type: source[:source_type]
                })
                feature_source.save!
            end
        end
    end
    

end