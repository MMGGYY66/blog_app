class LikesController < ApplicationController
  def create
    @like = Like.new(post_id: params[:post_id], user_id: params[:user_id])

    if @like.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash.now[:error] = 'Failed to like the post'
      # Instead of rendering the user_post_path in case of an error,
      # you might want to consider redirecting to the previous page
      # with the appropriate error message
      redirect_back(fallback_location: root_path)
    end
  end
end
