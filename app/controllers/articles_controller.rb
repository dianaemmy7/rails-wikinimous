class ArticlesController < ApplicationController
 # Magic comment
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    # set_task
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(task_params)
    @article.save
    redirect_to article_path(@article)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    # set_task
  end

  def update
    # set_task
    @article.update(task_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end

  def destroy
    # set_task
    @article.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path
  end

  private

  def task_params
    params.require(:article).permit(:title, :content)
  end

  def set_task
    @article = Article.find(params[:id])
  end
end
