class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show


  end
  def create
    @article = Article.new(article_params)
    @article.document = params[:article][:document]
    @article.save
    respond_with @article
  end
  private
   def article_params
     params.require(:article).premit(:name, :description, :pdf_file, :document, :picture)
   end
end
