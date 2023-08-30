class UsersController < ApplicationController
  # using .includes(:posts), you're eager loading the associated
  # posts for all users, which helps prevent N+1 query issues when
  # you access @user.posts.
  def index
    @users = User.all.includes(:posts) # Eager load associated posts
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.most_recent
  end
end
