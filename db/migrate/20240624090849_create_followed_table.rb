class CreateFollowedTable < ActiveRecord::Migration[7.1]
  def change
    create_table :followed do |t|
      t.integer :user_id
      t.integer :followed_user_id
      t.timestamps
    end
    add_foreign_key :followed, :users, column: :user_id
    add_foreign_key :followed, :users, column: :followed_user_id
  end
end
