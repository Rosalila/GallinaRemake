json.array!(@metrics) do |metric|
  json.extract! metric, :id, :name, :description, :weight, :corral_id, :metric_type
  json.url metric_url(metric, format: :json)
end
