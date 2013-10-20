json.array!(@locations) do |location|
  json.extract! location, :name, :address1, :address2, :state, :city, :zip
  json.url location_url(location, format: :json)
end
