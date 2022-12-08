class CreatePaletteTags < ActiveRecord::Migration[6.1]
  def change
    create_table :palette_tags do |t|
      t.references :palette, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :palette_tags, [:palette_id, :tag_id], unique: true
  end
end
