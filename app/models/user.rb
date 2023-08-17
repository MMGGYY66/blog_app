class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :likes, dependent: :destroy

  def most_recent(limit_number = 3)
    posts.order(created_at: :desc).limit(limit_number)
  end
end
