class CreateArtwork < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
      t.index [:title, :artist_id], unique: true
      t.index [:artist_id]
      t.timestamps
    end
  end
end
