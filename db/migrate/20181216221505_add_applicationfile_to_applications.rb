class AddApplicationfileToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :applicationfile, :string
  end
end
