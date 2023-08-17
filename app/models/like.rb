class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_likes_counter(post = post)
    post.update(likesCounter: post.likesCounter.to_i + 1) 
  end

end