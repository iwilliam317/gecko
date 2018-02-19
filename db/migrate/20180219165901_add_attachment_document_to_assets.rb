class AddAttachmentDocumentToAssets < ActiveRecord::Migration[5.1]
  def self.up
    change_table :assets do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :assets, :document
  end
end
