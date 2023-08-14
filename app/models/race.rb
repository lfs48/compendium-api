class Race < ApplicationRecord

    validates :name, 
    :description,
    presence: true

    has_many :feature_sources,
    as: :source,
    dependent: :delete_all

    has_many :features, 
    as: :source,
    through: :feature_sources

end