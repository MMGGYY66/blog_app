class AddForiegnKeysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :post, foreign_key: true
    add_reference :users, :like, foreign_key: true
    add_reference :users, :comment, foreign_key: true
  end
end
