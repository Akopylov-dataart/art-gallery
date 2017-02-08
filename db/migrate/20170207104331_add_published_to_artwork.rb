class AddPublishedToArtwork < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :published, :boolean, :default => false
  end
end
