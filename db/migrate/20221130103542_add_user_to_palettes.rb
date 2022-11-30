class AddUserToPalettes < ActiveRecord::Migration[6.1]
  def change
    add_reference :palettes, :user, null: false, foreign_key: true
  end
end
