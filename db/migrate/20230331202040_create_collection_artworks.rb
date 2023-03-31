class CreateCollectionArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_artworks do |t|
      t.integer :artwork_id, null: false, foreign_key: true
      t.integer :collection_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
