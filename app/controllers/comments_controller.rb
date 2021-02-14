class CommentsController < ApplicationController
  def create
    @micropost = current_user.microposts.build
    @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
    @comment = current_user.comments.build(comment_params)
    @comment.micropost_id = params[:micropost_id]
    #@micropost.micropost_id = Micropost.find(params[:micropost_id])
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      render 'toppages/index'
    end
  end
  
  def destroy
    @comment.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_to root_url
  end

 private

  def comment_params
      params.require(:comment).permit(:content)
  end
end


