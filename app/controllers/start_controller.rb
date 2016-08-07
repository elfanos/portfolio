class StartController < ApplicationController
  def index
    @headers = ["Italien","Kroatien","Kambodja","Vietnam","Thailand","Island","Sverige","USA"]
    @albums = Album.all
  end
end
