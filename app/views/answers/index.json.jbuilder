json.array!(@answers) do |answer|
  json.extract! answer, :id, :text, :question_id, :is_correct
  json.url answer_url(answer, format: :json)
end
