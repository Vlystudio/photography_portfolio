json.extract! photo, :id, :title, :category, :description, :created_at, :updated_at
json.url photo_url(photo, format: :json)
