class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.date :createdAt
      t.date :updatedAt
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
