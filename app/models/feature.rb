class Feature < ApplicationRecord

    validates :name, 
    :description, 
    :type, 
    :category, 
    presence: true

    validates :type, 
    inclusion: { 
        in: [
            "core",
            "major",
            "minor",
            "ribbon"
        ], 
        message: "must be one of: core, major, minor, ribbon"
    }

    validates :category, 
    inclusion: { 
        in: [
            "action", 
            "quick action", 
            "reaction",
            "passive",
            "triggered",
            "misc"
        ], 
        message: "must be one of: action, quick action, reaction, passive, triggered, misc"
    }

    belongs_to :source, polymorphic: true

end