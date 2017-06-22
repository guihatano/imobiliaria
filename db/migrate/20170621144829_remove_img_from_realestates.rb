class RemoveImgFromRealestates < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :realestates, :img
  end
end
