json.array!(@gallinas) do |gallina|
  json.extract! gallina, :id, :name, :image, :description
  json.url gallina_url(gallina, format: :json)
end
