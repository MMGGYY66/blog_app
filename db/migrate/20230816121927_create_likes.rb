class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.date :createdAt
      t.date :updatedAt

      t.timestamps
    end
  end
end
