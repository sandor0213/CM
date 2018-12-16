class Member < ApplicationRecord
	has_one :memberparam
	
	validate :is_valid_promocode

	def is_valid_promocode
		is_valid = (promocode == $member_code_string || promocode == $super_member_code_string)
		if !is_valid
			errors.add(:timeEnd, 'not valid promocode')
			throw(:abort)
		end
	end
	
end
