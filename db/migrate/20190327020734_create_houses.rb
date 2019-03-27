class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :mascot
      t.string :head
      t.string :element
      t.string :founder

      t.timestamps
    end
  end
end
