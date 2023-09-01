json.extract! spell, 
    :id, 
    :name,
    :description, 
    :rank,
    :material,
    :concentration,
    :duration,
    :range,
    :casting_time,
    :upcast,
    :aspects

json.dnd_class_ids spell.dnd_classes.map { |dndclass| dndclass.id }