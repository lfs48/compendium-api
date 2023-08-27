class Item < ApplicationRecord

    validates :name, 
    :description, 
    :kind,
    :rarity,
    :bulk,
    :value,
    presence: true

    validates :kind, inclusion: { in: %w(armor weapon tool commodity gear treasure wondrous consumable), message: "invalid kind"}
    validates :rarity, inclusion: { in: %w(common uncommon rare legendary artifact), message: "invalid rarity"}
    validates :value, format: { with: /\A\d+\z|\d+d\d+(\z|\*\d+\z)/, message: "invalid value"}

end