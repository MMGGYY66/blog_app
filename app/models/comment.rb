class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comment_counter(post)
    post.update(comments_counter: post.comments_counter.to_i + 1)
  end
end
