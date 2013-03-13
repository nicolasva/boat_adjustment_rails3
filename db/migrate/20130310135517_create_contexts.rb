class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.string :city, :null => false
      t.float :average_wind, :null => false
      t.float :wind_variation, :null => false
      t.float :wind_direction, :null => false
      t.string :sea_state, :null => false
      t.timestamps
    end

    
  end
end
