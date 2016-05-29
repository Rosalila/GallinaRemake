json.array!(@revieweds) do |reviewed|
  json.extract! reviewed, :id, :name, :gallina_id
  json.url reviewed_url(reviewed, format: :json)
end
