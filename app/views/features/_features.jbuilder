json.array! features do |feature|
    json.partial! "features/feature", feature: feature
end