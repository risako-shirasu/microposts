class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
      #@likes = current_user.liked_by?.order(id: :desc).page(params[:page])
      #@comments = @micropots.comments.includes(:user).all
      @comment  = @microposts.comments.build(user_id: current_user.id) if current_user
    end
  end
  
  private

  def micropost_params
    params.require(:comment).permit(:content)
  end
end

