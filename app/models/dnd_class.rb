class DndClass < ApplicationRecord

    validates :name, 
    :description, 
    :hp, 
    :armor, 
    :weapons,
    :defenses, 
    :skills, 
    :equipment,
    :spellcasting,
    presence: true

    validates :spellcasting, inclusion: { in: %w(full half third none), message: "must be one of: full, half, third, none"}
    validate :table_cols_validation

    def table_cols_validation
        unless table_cols.kind_of?(Hash)
            errors.add(:table_cols, "must be a json object")
        end
        table_cols.each do |key, value|
            unless key.kind_of?(String)
                errors.add(:table_cols, "keys must be strings")
            end
            unless value.kind_of?(Array)
                errors.add(:table_cols, "values must be arrays")
            end
            unless value.all? { |el| el.kind_of?(String) }
                errors.add(:table_cols, "array values must be strings")
            end
            unless value.length == 12
                errors.add(:table_cols, "arrays must have length of 12")
            end
        end
    end

    has_many :feature_sources,
    as: :source,
    dependent: :delete_all

    has_many :features, 
    as: :source,
    through: :feature_sources

end