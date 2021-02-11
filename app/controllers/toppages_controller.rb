class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
      @comments = @micorpost.comments #コメント表示用投稿に関連づくコメントの取得
      #@likes = current_user.liked_by?.order(id: :desc).page(params[:page])
    end
  end
  
  private

  def micropost_params
    params.require(:comment).permit(:content)
  end
end

