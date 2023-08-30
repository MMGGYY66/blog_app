class Comment < ApplicationRecord
  belongs_to :user
  # use eager loading to prevent N+1 query problems:
  # By adding counter_cache: true to the belongs_to :post association
  belongs_to :post, counter_cache: true

  after_create :update_comment_counter

  # make the update_comment_counter callback more efficient
  # by using the update_counters method
  def update_comment_counter
    Post.update_counters(post.id, comments_counter: 1)
  end
end
