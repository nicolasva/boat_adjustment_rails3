class CreateAdjustments < ActiveRecord::Migration
  def change
    create_table :adjustments do |t|
      t.string :name, :null => false
      t.float :value, :null => false
      t.references :adjustment_type
      t.timestamps
    end

    add_index :adjustments, [:adjustment_type_id], :name => "adjustments_type_id_to_adjustments"
  end
end
