class Post < ApplicationRecord
  # update the belongs_to :user association with the counter_cache option:
  belongs_to :user, foreign_key: :author_id, counter_cache: true
  # use eager loading to prevent N+1 query problems
  # By using includes(:user) in the has_many :comments association,
  # you're eager loading the associated user for each comment.
  # This will help prevent N+1 queries when accessing the comments and
  # their associated users.
  has_many :comments, -> { includes(:user) }, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_post_counter

  # recent_comments method can be further optimized using eager loading
  # to fetch the associated user and to prevent N+1 queries
  def self.recent_comments(post, limit = 5)
    post.comments.includes(:user).order(created_at: :desc).limit(limit)
  end

  # updates the posts counter for a user.
  private

  def update_post_counter()
    author.increment!(:posts_counter)
  end
end
