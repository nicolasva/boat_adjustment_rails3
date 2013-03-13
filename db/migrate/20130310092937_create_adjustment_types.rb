class CreateAdjustmentTypes < ActiveRecord::Migration
  def change
    create_table :adjustment_types do |t|
      t.string :name, :null => false
      t.references :boat_type
      t.timestamps
    end

    create_table :adjustment_types_contexts do |t|
      t.references :context
      t.references :adjustment_type
    end

    add_index :adjustment_types_contexts, [:context_id], :name => "adjustment_types_contexts_context_id_to_contexts"
    add_index :adjustment_types_contexts, [:adjustment_type_id], :name => "adjustment_types_contexts_to_adjustment_types"
    add_index :adjustment_types, [:boat_type_id], :name => "adjustment_types_contexts_to_boat_type"
  end
end
