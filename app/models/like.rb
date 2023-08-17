class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(post)
    post.update(likes_counter: post.likes_counter.to_i + 1)
  end
end
