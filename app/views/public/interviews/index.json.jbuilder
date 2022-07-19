json.array!(@interviews) do |interview|
  json.id interview.id
  json.title interview.title
  json.url url_for(public_interview_path(interview))
  json.start interview.schedule
  json.end interview.schedule
end