json.array!(@matches) do |match|
  json.extract! match, :game_time, :court_id
  json.url match_url(match, format: :json)
end
