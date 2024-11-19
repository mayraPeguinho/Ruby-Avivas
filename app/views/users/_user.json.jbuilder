json.extract! user, :id, :name, :email, :phone, :password, :role_id, :entryDate, :created_at, :updated_at
json.url user_url(user, format: :json)
