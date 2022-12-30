class CreatePaletteSeconds < ActiveRecord::Migration[6.1]
  def change
    create_table :palette_seconds do |t|
      t.string :main, null: false
      t.string :sub, null: false
      t.string :body, null: false
      t.string :bg, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
