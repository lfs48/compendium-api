class Spell < ApplicationRecord

    validates :name, 
    :description, 
    :rank, 
    :duration, 
    :range, 
    :casting_time,
    presence: true

    has_many :dnd_classes, through: :spell_classes

end