json.extract! album, :id, :name, :label, :release_date, :band_id, :artist, :references, :created_at, :updated_at
json.url album_url(album, format: :json)
