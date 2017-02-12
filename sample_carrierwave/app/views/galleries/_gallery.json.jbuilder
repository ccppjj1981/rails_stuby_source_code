json.extract! gallery, :id, :name, :images, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)