json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :tournament_type, :league_id
  json.url tournament_url(tournament, format: :json)
end
