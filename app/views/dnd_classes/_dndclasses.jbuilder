json.array! dndclasses do |dndclass|
    json.partial! "dnd_classes/dndclass", dndclass: dndclass
end