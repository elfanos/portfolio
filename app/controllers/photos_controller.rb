class PhotosController < ApplicationController
  def index
    @photo = Photo.all
  end
  def show
    @photo = Photo.find(params[:id])
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.new(photo_params)
    puts "aa", @photo
    if @photo.save
      redirect_to @photo
    else
      render 'new'
    end
  end

  def upload
   file_field = @params['form']['file'] rescue nil
   # file_field is a StringIO object
   file_field.content_type # 'text/csv'
   file_field.full_original_filename
  end

  private
    def photo_params
       params.require(:photo).permit(:picture, :album_id)
    end
end
