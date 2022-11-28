class CreatePalettes < ActiveRecord::Migration[6.1]
  def change
    create_table :palettes do |t|
      t.string :main
      t.string :sub
      t.string :body

      t.timestamps
    end
  end
end
