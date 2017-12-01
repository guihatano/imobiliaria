class Company < ApplicationRecord

	validates :name, :email, presence: true
	validates :facebook, :twitter, :instagram, :google_plus, allow_blank: true, url: true

	def address
		address = "#{street}"
		st_number.present? ? address << ", #{st_number}" : ""
		district.empty? ? "" : address << ", #{district}"
		city.empty? ? "" : address << ", #{city}"
		state.empty? ? "" : address << " - #{state}"

		address
	end

	def street_and_number
		address = "#{street}"
		st_number.present? ? address << ", #{st_number}" : ""
	end

	def city_and_state
		address = city.empty? ? "" : city
		state.empty? ? "" : address << " - #{state}"
	end
end
