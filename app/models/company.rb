class Company < ApplicationRecord

	validates :name, :email, presence: true

	def address
		address = "#{street}"
		st_number.present? ? address << ", #{st_number}" : ""
		district.empty? ? "" : address << ", #{district}"
		city.empty? ? "" : address << ", #{city}"
		state.empty? ? "" : address << " - #{state}"

		address
	end
end
