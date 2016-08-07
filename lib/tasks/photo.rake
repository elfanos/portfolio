
namespace :photo do
  # desc "Enqueues a job to get url from Elib and then thumb the cover."
  # it to a smaller one. Put it up on s3 and insert the new url for the
  # image to a column called cover_img
  task resize_photo: :environment do
    puts "hej"
    resize_covers
  end
  def resize_covers
    Photo.all.each do |photo|
      photo.picture.recreate_versions!
    end
  end
end
