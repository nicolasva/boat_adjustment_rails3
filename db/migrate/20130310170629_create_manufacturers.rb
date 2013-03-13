class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name, :null => false
      t.timestamps
    end

    create_table :boat_types_manufacturers do |t|
      t.references :manufacturer
      t.references :boat_type
    end

    add_index :boat_types_manufacturers, [:manufacturer_id], :name => "boat_types_manufacturer_id_to_manufacturers"
    add_index :boat_types_manufacturers, [:boat_type_id], :name => "boat_types_boat_to_boat_types"
  end
end
