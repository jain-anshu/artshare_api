class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.integer :owner_id, foreign_key: true, null: false
      t.string :name
      t.timestamps
    end
  end
end
