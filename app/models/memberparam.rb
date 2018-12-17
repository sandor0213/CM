class Memberparam < ApplicationRecord
	belongs_to :member

	 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", extraThumb: "50x50"}, default_url: "/images/:style/missing.png"
  	 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

validates :position, :email, :phonenumber, presence: true
validates :position, length: { in: 8..70, message: " must contain 8-70 characters" }
validates :email, uniqueness: true
validate :has_16

	def has_16
	child = birthday < 16.years.ago.to_date
		if  child
			errors.add(:birthday, 'You should be over 16 years old.')
			throw(:abort)
		end
	end


end
