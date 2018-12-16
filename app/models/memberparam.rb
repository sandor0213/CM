class Memberparam < ApplicationRecord
	belongs_to :member

	 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", extraThumb: "50x50"}, default_url: "/images/:style/missing.png"
  	 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
