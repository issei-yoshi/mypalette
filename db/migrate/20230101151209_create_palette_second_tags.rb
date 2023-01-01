class CreatePaletteSecondTags < ActiveRecord::Migration[6.1]
  def change
    create_table :palette_second_tags do |t|
      t.references :palette_second, null: false, foreign_key: true
      t.references :tag_second, null: false, foreign_key: true

      t.timestamps
    end

    add_index :palette_second_tags, [:palette_second_id, :tag_second_id], unique: true
  end
end
