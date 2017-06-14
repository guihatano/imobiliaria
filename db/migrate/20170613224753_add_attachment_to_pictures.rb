class AddAttachmentToPictures < ActiveRecord::Migration[5.0]
  def change
  	change_table :pictures do |t|
      t.attachment :image
    end
  end
end
