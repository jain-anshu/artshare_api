class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, null: false, foreign_key: true
      t.integer :viewer_id, null: false, foreign_key: true
      t.index [:artwork_id, :viewer_id], unique: true
      t.index :artwork_id, name: :artwork_index
      t.index :viewer_id, name: :viewer_index
      t.timestamps
    end
  end
end
