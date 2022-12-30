class CreatePaletteSeconds < ActiveRecord::Migration[6.1]
  def change
    create_table :palette_seconds do |t|

      t.timestamps
    end
  end
end
