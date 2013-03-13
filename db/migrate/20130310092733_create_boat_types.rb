class CreateBoatTypes < ActiveRecord::Migration
  def change
    create_table :boat_types do |t|
      t.string :model, :null => false
      t.float :length
      t.float :width
      t.string :serial_number_sail
      t.string :serial_number_jib_sail
      t.string :serial_number_spineaker
      t.timestamps
    end
  end
end
