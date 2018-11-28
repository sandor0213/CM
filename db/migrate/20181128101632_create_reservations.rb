class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :meetroom_id
      t.string :userName
      t.date :dateBoth
      t.time :timeStart
      t.time :timeEnd
      t.datetime :timeDateStart
      t.datetime :timeDateEnd

      t.timestamps
    end
  end
end
