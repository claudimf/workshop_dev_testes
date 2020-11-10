json.extract! user, :id, :role, :name, :active, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
