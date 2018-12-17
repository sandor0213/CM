class Application < ApplicationRecord
	belongs_to :vacancy
	
mount_uploader :applicationfile, ApplicationfileUploader

validates :firstname, :lastname, :email, :expectedsalary, :currency, :skype, presence: true
validates :expectedsalary, numericality: {only_integer: true}
validates :firstname, :lastname, length: { in: 3..20 }, format: { with: /\A[a-zA-Z]+\z/,
    message: " must contain 3-20 letters" }

    validates :phonenumber,   :presence => {:message => 'not valid'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 15 }

validates :applicationfile, presence: { message: ": Please attach your cv in filetype .pdf" }

validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
