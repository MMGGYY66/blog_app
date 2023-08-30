class Like < ApplicationRecord
  belongs_to :user
  # use eager loading to prevent N+1 query problems
  # By adding counter_cache: true to the belongs_to :post association
  # using a counter cache to efficiently keep track of the number of likes for a post.
  belongs_to :post, counter_cache: true

  after_create :update_likes_counter

  private

  # make the update_likes_counter callback more efficient by using
  # the update_counters method
  def update_likes_counter
    Post.update_counters(post.id, likes_counter: 1)
  end
end
