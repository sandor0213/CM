class CreateMeetrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :meetrooms do |t|
      t.integer :number
      t.string :title


      t.timestamps
    end
  end
end
