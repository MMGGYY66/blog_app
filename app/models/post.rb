class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # updates the posts counter for a user.
  def self.update_post_counter(user)
    user.update(posts_counter: user.posts_counter.to_i + 1)
  end

  # return the 5 most recent comments for a given post.
  def self.recent_comments(post, limit = 5)
    post.comments.order(created_at: :desc).limit(limit)
  end
end
