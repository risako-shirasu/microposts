class PostController < ApplicationController
  def create
    @post = Post.new(post_params)
  end

private

  def post_params
    params.require(:post).permit(:image)
  end
end