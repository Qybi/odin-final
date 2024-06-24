class CreateFollowersTable < ActiveRecord::Migration[7.1]
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.integer :follower_id
      t.timestamps
    end
    add_foreign_key :followers, :users, column: :user_id
    add_foreign_key :followers, :users, column: :follower_id
  end
end
