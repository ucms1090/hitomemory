class CreateMemoryUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :memory_users do |t|
      t.references :memory, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
