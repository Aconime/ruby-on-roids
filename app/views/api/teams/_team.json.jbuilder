json.extract! team, :id, :name, :owner_id, :points,
  :created_at, :updated_at
json.url api_team_url(team, format: :json)
