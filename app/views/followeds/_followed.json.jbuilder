json.extract! followed, :id, :user_id, :followed_user_id, :created_at, :updated_at
json.url followed_url(followed, format: :json)
