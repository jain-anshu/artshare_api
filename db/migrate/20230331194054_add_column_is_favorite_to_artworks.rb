class AddColumnIsFavoriteToArtworks < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :is_favorite, :boolean, default: false
  end
end
