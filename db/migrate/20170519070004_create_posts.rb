class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :classpage_id
      t.string :created_at
      t.string :updated_at
      t.string :picture

      t.timestamps
    end
  end
end
