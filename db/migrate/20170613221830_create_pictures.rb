class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :image
      t.integer :realestate_id

      t.timestamps
    end
  end
end
