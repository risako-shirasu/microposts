class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
      #@likes = current_user.liked_by?.order(id: :desc).page(params[:page]) ←不要
      @comment = current_user.comments.build
      #@comments= current_user.comments.order(id: :desc).page(params[:page])
      #↑自分の投稿の一覧
    end
  end
  
  private

  def micropost_params
    params.require(:comment).permit(:content)
  end
end

