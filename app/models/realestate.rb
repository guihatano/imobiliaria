class Realestate < ApplicationRecord
	extend Enumerize

	has_many :pictures, :dependent => :destroy
	
	enumerize :re_type, in: [:house, :apartment, :rural, :plot]
	enumerize :category, in: [:rent, :sale, :both]

  validates :re_type, :street, :district, :city, :state, :category, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  # ensures the realestate has images
  scope :with_images, -> {left_outer_joins(:pictures).where('pictures.realestate_id IS NOT NULL').distinct}

	def self.search(search)
	  where("street LIKE ?", "%#{search}%")
	  	.or(where("district LIKE ?", "%#{search}%"))
	  	.or(where("city LIKE ?", "%#{search}%"))
	  	.or(where("state LIKE ?", "%#{search}%"))
	end
end
