class AddColumnIsFavoriteToArtworkShares < ActiveRecord::Migration[7.0]
  def change
    add_column :artwork_shares, :is_favorite, :boolean, default: false
  end
end
