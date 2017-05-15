class ArticlesController < ApplicationController
  def index
      @articles = Article.all
    end
  def show
      @article = Article.find(params[:id])
    end
  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :text))

    @article.save
    redirect_to @article
  end
  # def update
  #   if @post.update_attributes(post_params)
  #     flash[:notice] = "Successfully updated post!"
  #     redirect_to post_path(@posts)
  #   else
  #     flash[:alert] = "Error updating post!"
  #     render :edit
  #   end
  # end
  def destroy
    if @article.destroy
      flash[:notice] = "Successfully deleted article!"
      redirect_to article_path
    else
      flash[:alert] = "Error updating article!"
    end
  end

end
