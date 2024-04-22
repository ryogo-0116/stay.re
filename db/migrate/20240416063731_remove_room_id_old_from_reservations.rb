class RemoveRoomIdOldFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :room_id_old, :integer
  end
end

