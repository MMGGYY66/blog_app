class PostsController < ApplicationController
  # using the includes method to eager load the posts associated
  # with the user.
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(author: current_user, **post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      flash.now[:error] = 'Failed to create the post.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
