class FavoritesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

