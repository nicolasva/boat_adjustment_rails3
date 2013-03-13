class CreateCrews < ActiveRecord::Migration
  def change
    create_table :crews do |t|
      t.float :crew_weight, :null => false
      t.timestamps
    end

    create_table :contexts_crews do |t|
      t.references :crew
      t.references :context
    end

    add_index :contexts_crews, [:crew_id], :name => "contexts_crews_crew_id_to_crews"
    add_index :contexts_crews, [:context_id], :name => "contexts_crew_context_id_to_contexts"
  end
end
