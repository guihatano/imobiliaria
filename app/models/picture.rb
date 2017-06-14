class Picture < ApplicationRecord
	belongs_to :realestate

   has_attached_file :image, 
		styles: { medium: "300x300>", thumb: "100x100>" },
		default_url: "/images/:style/missing.png"

  do_not_validate_attachment_file_type :image
end
