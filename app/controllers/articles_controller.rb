class ArticlesController < ApplicationController
def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to task_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to task_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

private

def task_params
  params.require(:article).permit(:title, :content)
end

end
