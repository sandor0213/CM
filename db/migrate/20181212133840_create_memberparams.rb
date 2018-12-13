class CreateMemberparams < ActiveRecord::Migration[5.2]
  def change
    create_table :memberparams do |t|
      t.integer :member_id
      t.text :position
      t.string :email
      t.string :skype
      t.string :phonenumber
      t.string :emergencyname
      t.string :emergencyphonenumber

      t.timestamps
    end
  end
end
