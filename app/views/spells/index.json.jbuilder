json.array! @spells do |spell|
    json.partial! "spells/spell", spell: spell
end