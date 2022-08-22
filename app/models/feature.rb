class Feature < ApplicationRecord

    validates :name, 
    :description, 
    :kind, 
    presence: true

    validates :kind, 
    inclusion: { 
        in: [
            "standard",
            "feat",
            "boon"
        ], 
        message: "must be one of: standard, feat, boon"
    }

    validates :level, numericality: {
        allow_nil: true,
        only_integer: true,
        greater_than: 0,
        less_than_or_equal_to: 12
    }

    has_many :feature_sources, 
    dependent: :delete_all

    has_many :source_classes, 
    through: :feature_sources,
    source: :source,
    source_type: 'DndClass'

    has_many :source_races, 
    through: :feature_sources,
    source: :source,
    source_type: 'Race'

    def sources
        all_sources = []
        all_sources += self.source_classes
        all_sources += self.source_races
        return all_sources
    end

end