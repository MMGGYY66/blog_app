class UsersController < ApplicationController
  # using .includes(:posts), you're eager loading the associated
  # posts for all users, which helps prevent N+1 query issues when
  # you access @user.posts.
  def index
    @users = User.includes(:posts, :comments).limit(10) # Adjust the limit as needed
  end

  def show
    # use eager loading to prevent N+1 query problems.
    @user = User.includes(:bio).find(params[:id])

    # use a specific query to fetch only the required posts.
    # This can help in reducing the data transferred from the database.
    @recent_posts = @user.most_recent.limit(10) # Adjust the limit as needed
  end
end
