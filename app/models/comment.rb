class Comment < ApplicationRecord
  belongs_to :user
  # use eager loading to prevent N+1 query problems:
  # By adding counter_cache: true to the belongs_to :post association
  belongs_to :post, counter_cache: true

  after_create :update_comment_counter

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
