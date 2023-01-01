class CreatePaletteSecondTags < ActiveRecord::Migration[6.1]
  def change
    create_table :palette_second_tags do |t|
      t.references :palette_second, null: false, foreign_key: true
      t.references :tag_second, null: false, foreign_key: true

      t.timestamps
    end
  end
end
