class CreatePalettes < ActiveRecord::Migration[6.1]
  def change
    create_table :palettes do |t|
      t.string :main, null: false
      t.string :sub, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
