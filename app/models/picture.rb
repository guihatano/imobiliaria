class Picture < ApplicationRecord
	belongs_to :realestate

  has_attached_file :image, 
		styles: { medium: "x200>", thumb: "x100>" , 
			:original => {
				:processors => [:watermark],
				:watermark_path => "#{Rails.root}/app/assets/images/logo.png",
				:geometry => '800>',
				:position => 'SouthEast',
				:watermark_dissolve => 70,
				:auto_orient => false
			}},
		default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
