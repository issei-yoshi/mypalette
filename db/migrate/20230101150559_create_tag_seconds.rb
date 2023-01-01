class CreateTagSeconds < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_seconds do |t|
      t.string :name

      t.timestamps
    end
  end
end
