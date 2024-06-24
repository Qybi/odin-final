class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :author_id

      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0
      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id
    # adding these because im pepega and forgot i should've created the post table first
    add_foreign_key :likes, :posts, column: :post_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
