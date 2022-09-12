class Boon < ApplicationRecord

    validates :name, 
    :description,
    presence: true

    validates :source_type,
    inclusion: { 
        in: [
            nil,
            "DndClass",
            "Race"
        ], 
        message: "must be null or one of: DndClass, Race"
    }

    belongs_to :source,
    optional: true,
    polymorphic: true,
    dependent: :delete

end