class CreateCommentsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :author_id
      t.integer :post_id
      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
  end
end
