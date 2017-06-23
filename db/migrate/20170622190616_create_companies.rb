class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :cellphone
      t.string :creci
      t.string :email
      t.string :street
      t.integer :st_number
      t.string :district
      t.string :city
      t.string :state
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :google_plus

      t.timestamps
    end
  end
end
