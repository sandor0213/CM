class AddAttachmentAvatarToMemberparams < ActiveRecord::Migration[5.2]
  def self.up
    change_table :memberparams do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :memberparams, :avatar
  end
end
