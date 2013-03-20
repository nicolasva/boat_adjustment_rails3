class AddColumnUserIdToCrews < ActiveRecord::Migration
  def change
    add_column(:crews, :user_id, :integer, :default => 1, :null => false)
    add_index(:crews, [:user_id], :name => "crews_user_id_to_users")
  end
end
