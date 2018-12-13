class AddBirthdayToMemberparams < ActiveRecord::Migration[5.2]
  def change
    add_column :memberparams, :birthday, :date
  end
end
