json.extract! event, :id, :created_at, :updated_at
json.url api_event_url(event, format: :json)
