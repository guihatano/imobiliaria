class Picture < ApplicationRecord
	belongs_to :realestate

  has_attached_file :image, 
		styles: { medium: "x300>", thumb: "x100>" },
		default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
