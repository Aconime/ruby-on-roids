json.extract! user, :id, :first_name, :last_name, :email,
  :role, :team_id, :technologies, :bio, :image_url,
  :created_at, :updated_at
json.url api_user_url(user, format: :json)
