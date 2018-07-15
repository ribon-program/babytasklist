class ArticlesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end  
  
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = '記事を投稿しました。'
      redirect_to user_path(current_user) #root_url
    else
      @articles = current_user.articles.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '記事の投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end 
  
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:success] = '記事は正常に更新されました'
      redirect_to @article
    else
      flash.now[:danger] = '記事は更新されませんでした'
      render :edit
    end
  end  

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash[:success] = '記事は正常に削除されました'
    redirect_to user_path(current_user) #articles_url
  end
  
  def pregnant
    @articles = Article.where(event_id: '1').page(params[:page]) #カテゴリー限定して管理者ページ記事一覧から取りたい
  end  
  
  def birth
    @articles = Article.where(event_id: '2').page(params[:page]) #カテゴリー限定して管理者ページ記事一覧から取りたい
  end  
  
  def child_care
    @articles = Article.where(event_id: '3').page(params[:page]) #カテゴリー限定して管理者ページ記事一覧から取りたい
  end  
  
  private
  
  def article_params
    params.require(:article).permit(:content, :title, :event_id, :place_id, :id)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_url
    end
  end
end
