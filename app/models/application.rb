class Application < ApplicationRecord
	belongs_to :vacancy
	
mount_uploader :applicationfile, ApplicationfileUploader

validates :firstname, :lastname, :email, :expectedsalary, :currency, :skype, presence: true
validates :expectedsalary, numericality: {only_integer: true}
validates :firstname, :lastname, length: { in: 3..20 }, format: { with: /\A[a-zA-Z]+\z/,
    message: " must contain 3-20 letters" }

    


end
