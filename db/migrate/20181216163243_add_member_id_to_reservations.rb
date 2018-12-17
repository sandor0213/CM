class AddMemberIdToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :member_id, :integer
  end
end
