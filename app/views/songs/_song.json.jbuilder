json.extract! song, :id, :title, :length, :position, :album_id, :created_at, :updated_at
json.url song_url(song, format: :json)
