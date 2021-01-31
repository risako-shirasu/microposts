class FavoritesController < ApplicationController
  def create
    user = User.find(params[:micropost_id])
    current_user.favorite(user)
    flash[:success] = '投稿をお気に入りにしました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:micropost_id])
    current_user.unfavorite(user)
    flash[:success] = '投稿のお気に入りを解除しました。'
    redirect_to user
  end
end
