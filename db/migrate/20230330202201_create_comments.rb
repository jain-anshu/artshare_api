class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false, foreign_key: true
      t.integer :artwork_id, null: false, foreign_key: true
      t.text :body
      t.index :author_id, name: :comment_author_index
      t.index :artwork_id, name: :comment_artwork_index
      t.timestamps
    end
  end
end
