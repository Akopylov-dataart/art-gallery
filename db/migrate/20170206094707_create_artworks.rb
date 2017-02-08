class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.integer :year
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
