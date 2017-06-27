class Message

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :phone, :content

  validates :name, :content, :email, presence: true
  validates :name, length: { minimum: 3 }, allow_blank: true
  validates :email, email: true, allow_blank: true

end