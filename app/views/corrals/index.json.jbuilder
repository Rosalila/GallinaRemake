json.array!(@corrals) do |corral|
  json.extract! corral, :id, :name, :image, :description, :agreement
  json.url corral_url(corral, format: :json)
end
