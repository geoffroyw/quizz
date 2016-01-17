json.array!(@exams) do |exam|
  json.extract! exam, :id, :minimal_score, :name
  json.url exam_url(exam, format: :json)
end
