class AddLocationToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :location, :string
  end
end
