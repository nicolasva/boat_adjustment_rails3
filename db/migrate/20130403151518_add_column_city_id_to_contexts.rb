class AddColumnCityIdToContexts < ActiveRecord::Migration
  def chnage
    add_column :contexts, :city_id, :integer
    add_index "contexts", ["city_id"], :name => "city_city_id_to_context"
  end
end
