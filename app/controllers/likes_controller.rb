class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])

    if @like.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Failed to like the post'
      render user_post_path(params[:user_id], params[:post_id])
    end
  end
end
