class UsersController < ApplicationController
  def index
    @article = Article.new
    @users = User.all.page(params[:page])
  end

  def show
    @articles = Article.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = '記事を投稿しました。'
      redirect_to @user
    else
      flash.now[:danger] = '記事の投稿に失敗しました。'
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
