class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :firstname
      t.string :lastname
      t.integer :phonenumber
      t.string :email
      t.integer :expectedsalary
      t.string :linkedin
      t.string :github

      t.timestamps
    end
  end
end
