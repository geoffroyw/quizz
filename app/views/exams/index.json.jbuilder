json.array!(@exams) do |exam|
  json.extract! exam, :id, :intro_text
  json.url exam_url(exam, format: :json)
end
