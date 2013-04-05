class RemoveColumnCityInContexts < ActiveRecord::Migration
  def up
    remove_column :contexts, :city
  end
end
