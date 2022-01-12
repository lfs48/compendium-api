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
        only_integer: true,
        greater_than: 0,
        less_than_or_equal_to: 20
    }

    belongs_to :feature
    belongs_to :source, polymorphic: true
    

end