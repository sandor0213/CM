class AddNameToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :firstname, :string
    add_column :members, :lastname, :string
  end
end
