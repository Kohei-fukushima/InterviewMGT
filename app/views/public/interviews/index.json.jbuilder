json.array!(@interview_all) do |interview|
  json.id interview.id
  json.title interview.title
  json.url url_for(interview_path(interview))
  json.start interview.schedule
  json.end interview.schedule
end