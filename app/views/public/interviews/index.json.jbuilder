json.array!(@interviews) do |interview|
  json.id interview.id
  json.title interview.title
  json.start interview.created_at
  json.end interview.schedule
end