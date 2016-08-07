class Article < ApplicationRecord
  has_attached_file :document, styles: {thumbnail: "60x60#"}
  validates_attachment :document, content_type: { content_type: "application/pdf" }
  mount_uploader :picture, PictureUploader
end
