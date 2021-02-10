class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create 
    @comment = current_user.comments.build(comment_params)
    @comment.micropost_id = params[:micropost_id]
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

 private

  def comment_params
      params.require(:comment).permit(:content)
  end
end