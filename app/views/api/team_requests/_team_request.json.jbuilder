json.extract! team_request, :id, :team_id, :user_id, :message,
  :created_at, :updated_at
json.url api_team_request_url(team_request, format: :json)
