class Realestate < ApplicationRecord

	has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  validates :re_type, :street, :district, :city, :state, :category, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
end
