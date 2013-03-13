class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name, :null => false
      t.timestamps
    end

    create_table :boat_types_sellers do |t|
      t.references :seller
      t.references :boat_type
    end

    add_index :boat_types_sellers, [:seller_id], :name => "boat_types_seller_id_to_sellers"
    add_index :boat_types_sellers, [:boat_type_id], :name => "boat_types_boat_type_id_to_boat_types"
  end
end
