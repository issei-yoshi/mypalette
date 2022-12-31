class CreateLikeSeconds < ActiveRecord::Migration[6.1]
  def change
    create_table :like_seconds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :palette_second, null: false, foreign_key: true

      t.timestamps
    end

    add_index :like_seconds, [:user_id, :palette_second_id], unique: true
  end
end
