class Company < ApplicationRecord

	validates :name, :email, presence: true
end
