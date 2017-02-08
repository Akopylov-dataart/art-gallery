json.extract! artwork, :id, :title, :year, :artist_id, :published, :created_at, :updated_at
json.artist artwork.artist.name
json.image artwork.image.url
json.mediums artwork.medium_list
json.url artwork_url(artwork)
json.url_json artwork_url(artwork, format: :json)