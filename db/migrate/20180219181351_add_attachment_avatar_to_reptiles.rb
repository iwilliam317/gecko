class AddAttachmentAvatarToReptiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :reptiles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :reptiles, :avatar
  end
end
