json.total_pages @artworks.total_pages
json.current_page @artworks.current_page
json.data do
  json.array!(@artworks, partial: 'artworks/artwork', as: :artwork)
end