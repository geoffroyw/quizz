json.array!(quizzs) do |quizz|
  json.extract! quizz, :id, :intro_text
  json.url quizz_url(quizz, format: :json)
end
