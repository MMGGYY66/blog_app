class AddIndexToForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :post_id
    add_index :users, :comment_id
    add_index :users, :like_id

    add_index :posts, :author_id
    add_index :posts, :like_id

    add_index :comments, :author_id
    add_index :comments, :post_id
    
    add_index :likes, :author_id
    add_index :likes, :post_id
  end
end
