json.array! @boons do |boon|
    json.partial! "boons/boon", boon: boon
end