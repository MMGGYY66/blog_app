class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment was successfully created.'
    else
      flash.now[:error] = 'Failed to create the comment.'
      # instead of rendering the new view in case of an error, you might
      # want to consider redirecting back to the previous page with
      # the appropriate error message.
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
