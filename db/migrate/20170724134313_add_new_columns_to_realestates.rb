class AddNewColumnsToRealestates < ActiveRecord::Migration[5.0]
  def change
  	add_column :realestates, :rooms, :integer, :default => 0
  	add_column :realestates, :bathrooms, :integer, :default => 0
  	add_column :realestates, :ensuites, :integer, :default => 0
  	add_column :realestates, :kitchens, :integer, :default => 0
  	add_column :realestates, :toilets, :integer, :default => 0
  	add_column :realestates, :living_rooms, :integer, :default => 0
  	add_column :realestates, :dining_rooms, :integer, :default => 0
  	add_column :realestates, :parking_spaces, :integer, :default => 0
  end
end
