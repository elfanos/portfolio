class CreateCovers < ActiveRecord::Migration[5.0]
  def change
    create_table :covers do |t|
      t.references :genre, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
