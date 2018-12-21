class AddDatebothToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :dateBoth, :date
  end
end
