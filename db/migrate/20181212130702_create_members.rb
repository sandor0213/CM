class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.string :passwordconfirmation
      t.string :promocode

      t.timestamps
    end
  end
end
