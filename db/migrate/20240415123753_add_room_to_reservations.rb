class AddRoomToReservations < ActiveRecord::Migration[6.1]
  def change
    unless column_exists?(:reservations, :room_id)
      add_reference :reservations, :room, null: false, foreign_key: true
    end
  end
end

