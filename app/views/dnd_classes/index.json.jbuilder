json.dndclasses do
    @dndclasses.each do |dndclass|
        json.set! dndclass.id do
            json.partial! "dnd_classes/dndclass", dndclass: dndclass
        end
    end
end