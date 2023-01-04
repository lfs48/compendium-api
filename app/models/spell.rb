class Spell < ApplicationRecord

    validates :name, 
    :description, 
    :rank, 
    :duration, 
    :range, 
    :casting_time,
    presence: true

end