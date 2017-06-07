json.extract! realestate, :id, :re_type, :street, :district, :city, :state, :category, :price, :description, :img, :created_at, :updated_at
json.url realestate_url(realestate, format: :json)
