class Vacancy < ApplicationRecord
	has_many :applications, dependent: :destroy

def timestart_earlier_now
	earlierNow = deadline < Time.current
		if  earlierNowDate
			errors.add(:deadline, 'is earlier now')
			throw(:abort)
		end
	end


end
