class AddBgimageToPalettes < ActiveRecord::Migration[6.1]
  def change
    add_column :palettes, :bgimage, :integer, default: 0, null: false
  end
end
