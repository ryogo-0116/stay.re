class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.date :check_in_date
      t.date :check_out_date
      t.integer :num_of_guests

      t.timestamps
    end
  end
end
