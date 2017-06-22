class AddCoverToRealestates < ActiveRecord::Migration[5.0]
  def change
    add_column :realestates, :cover, :integer
  end
end
