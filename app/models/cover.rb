class Cover < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :genre
end
