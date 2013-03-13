class CreateDaytimes < ActiveRecord::Migration
  def change
    create_table :daytimes do |t|
      t.datetime :day
      t.references :context
      t.timestamps
    end

    add_index :daytimes, [:context_id], :name => "daytimes_context_id_to_contexts"
  end
end
