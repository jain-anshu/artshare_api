class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false, foreign_key: true
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
