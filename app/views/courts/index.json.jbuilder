json.array!(@courts) do |court|
  json.extract! court, :type, :open, :location_id
  json.url court_url(court, format: :json)
end
