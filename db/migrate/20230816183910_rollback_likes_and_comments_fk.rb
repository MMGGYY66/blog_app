class RollbackLikesAndCommentsFk < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :author_id, :user_id
    rename_column :likes, :author_id, :user_id
  end
end
