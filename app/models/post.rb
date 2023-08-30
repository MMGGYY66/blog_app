class Post < ApplicationRecord
  # update the belongs_to :user association with the counter_cache option:
  belongs_to :user, foreign_key: :author_id, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_post_counter
  # return the 5 most recent comments for a given post.
  def self.recent_comments(post, limit = 5)
    post.comments.order(created_at: :desc).limit(limit)
  end

  # updates the posts counter for a user.
  private

  def update_post_counter()
    author.increment!(:posts_counter)
  end
end
