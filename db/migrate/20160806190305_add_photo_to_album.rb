class AddPhotoToAlbum < ActiveRecord::Migration[5.0]
  def change
    add_reference :albums, :photo, foreign_key: true
  end
end
