class Restaurant < ActiveRecord::Base
  mount_uploader :image, ImageUploader 
  has_many :reviews 
  
  validates :name, :address, :website, :image, presence: true 

  validates :phone, format: {with: /\A\(\d{3}\) \d{3}-\d{4}\z/, 
    message: "Must be in format (123) 456-7890"}

  validates :website, format: {with: /\Ahttps?:\/\/.*\z/, 
    message: "Must start with http://or https://"}
    
  validates :address, format: {with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/, 
    message: "Address must be in format: 350 Fifth Ave, New York, NY 89334"}


end
