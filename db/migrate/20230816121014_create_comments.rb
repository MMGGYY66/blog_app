class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.date :updatedAt
      t.date :createdAt
      
      t.timestamps
    end
  end
end
