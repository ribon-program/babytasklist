class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @article = current_user.articles.build  # form_for 用
      @articles = current_user.articles.order('created_at DESC').page(params[:page])
    end
  end
end
