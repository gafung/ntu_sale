class RemoveUserItemFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :user_id_id, :string
    remove_column :reservations, :item_id_id, :string
  end
end
