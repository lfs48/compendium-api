class Feat < ApplicationRecord

    validates :name, 
    :description,
    presence: true

    belongs_to :dnd_class

end