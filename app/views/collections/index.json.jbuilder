json.array! @cols do |col|
    json.partial! "collections/collection", col: col
end