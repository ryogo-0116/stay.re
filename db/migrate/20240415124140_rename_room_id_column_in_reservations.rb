class RenameRoomIdColumnInReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :room_id, :room_id_old
  end
end
