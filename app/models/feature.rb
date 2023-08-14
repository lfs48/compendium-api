class Feature < ApplicationRecord

    validates :name, 
    :description,
    presence: true

    validates :level, numericality: {
        allow_nil: true,
        only_integer: true,
        greater_than: 0,
        less_than_or_equal_to: 12
    }

    validates :kind, , inclusion: { in: %w(core major minor), message: "must be one of: core major minor"}

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