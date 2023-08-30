class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # The most_recent method can be further optimized using eager
  # loading to fetch the associated author (user) and to prevent N+1 queries:
  def most_recent(limit_number = 3)
    posts.includes(:author).order(created_at: :desc).limit(limit_number)
  end
end
