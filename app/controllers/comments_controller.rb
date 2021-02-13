class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create 
    @comment = current_user.comments.build(comment_params)
    @micropost = Micropost.find(params[:id])
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_to root_url
    else
      flash[:success] = "コメントできませんでした"
      render 'toppages/index'
    end
  end

 private

  def comment_params
      params.require(:comment).permit(:content)
  end
end


