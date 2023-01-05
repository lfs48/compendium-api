json.extract! spell, 
    :id, 
    :name,
    :description, 
    :rank,
    :verbal,
    :somatic,
    :material,
    :material_description,
    :concentration,
    :duration,
    :range,
    :casting_time,
    :higher_level

json.dnd_class_ids spell.dnd_classes.map { |dndclass| dndclass.id }