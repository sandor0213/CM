class Member < ApplicationRecord
	has_one :memberparam, dependent: :destroy

validates :username, :password, :passwordconfirmation, :promocode, :firstname, :lastname, presence: true
validates :firstname, :lastname, length: { in: 3..20 }, format: { with: /\A[a-zA-Z]+\z/,
    message: " must contain 3-20 letters" }
validates :username, length: { in: 5..20, message: " must contain 3-20 characters" }
validates :password, length: { in: 6..15, message: " must contain 6-15 characters" }
validates :username, uniqueness: true



	validate :confirm_password
	validate :is_valid_promocode

	def confirm_password
		is_equal = password == passwordconfirmation
		if !is_equal
			errors.add(:password, ' and password confirmation not equal')
			throw(:abort)
		end
	end	

	def is_valid_promocode
		is_valid = (promocode == $member_code_string || promocode == $super_member_code_string)
		if !is_valid
			errors.add(:promocode, 'not valid')
			throw(:abort)
		end
	end

	
	
end

