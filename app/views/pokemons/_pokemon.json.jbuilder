json.extract! pokemon, :id, :name, :base_experience, :sprite_url, :user_id, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
