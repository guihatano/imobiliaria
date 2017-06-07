class CreateRealestates < ActiveRecord::Migration[5.0]
  def change
    create_table :realestates do |t|
      t.string :re_type
      t.string :street
      t.string :district
      t.string :city
      t.string :state
      t.string :category
      t.float :price
      t.text :description
      t.attachment :img

      t.timestamps
    end
  end
end
