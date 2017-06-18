class RemoveStringImageFromPictures < ActiveRecord::Migration[5.0]
  def change
  	remove_column :pictures, :image, :string
  end
end
