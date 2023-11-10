json.dnd_classes do
    json.partial! "dnd_classes/dndclasses", dndclasses: @dndclasses
end

json.features do
    json.partial! "features/features", features: @features
end

json.races do
    json.partial! "races/races", races: @races
end

json.items do
    json.partial! "items/items", items: @items
end

json.spells do
    json.partial! "spells/spells", spells: @spells
end