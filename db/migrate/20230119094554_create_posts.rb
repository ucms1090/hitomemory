class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :memory_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.string :search_word
      t.datetime :start_time

      t.timestamps
    end
  end
end
