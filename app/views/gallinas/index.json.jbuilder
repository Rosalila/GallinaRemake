json.array!(@gallinas) do |gallina|
  json.extract! gallina, :id, :name, :image, :description, :corral_id
  json.url gallina_url(gallina, format: :json)
end
