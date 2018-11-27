class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :meetroom_id
      t.string :userName
      t.string :date
      t.string :timeStart
      t.string :timeEnd

      t.timestamps
    end
  end
end
