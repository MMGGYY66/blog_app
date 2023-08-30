class Like < ApplicationRecord
  belongs_to :user
  # use eager loading to prevent N+1 query problems
  # By adding counter_cache: true to the belongs_to :post association
  # using a counter cache to efficiently keep track of the number of likes for a post.
  belongs_to :post, counter_cache: true

  after_create :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
