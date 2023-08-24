class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id:1)
    @recent_posts = @user.most_recent
  end
end
