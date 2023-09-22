class Spell < ApplicationRecord

    validates :name, 
    :description, 
    :rank, 
    :duration, 
    :range,
    :targets,
    :casting_time,
    presence: true

end