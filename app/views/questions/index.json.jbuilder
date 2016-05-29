json.array!(@questions) do |question|
  json.extract! question, :id, :sentence, :wanted, :not_wanted, :metric_id, :question_type_id
  json.url question_url(question, format: :json)
end
