class Reservation < ApplicationRecord
	belongs_to :meetroom

	validates :dateBoth, :timeStart, :timeEnd, presence: true

	validate :timestart_earlier_now
	validate :already_reserved
	validate :timestart_later_timeend
	


	def timestart_earlier_now
		binding.pry
	earlierNow = timeStart < Time.current
	earlierNowDate = dateBoth < Time.current.to_date
	datesEqual = dateBoth == Time.current.to_date
	
		if  earlierNowDate || (datesEqual && earlierNow)
			errors.add(:timeStart, 'start earlier now')
			throw(:abort)
		end
	end

	def already_reserved
		@reservations = Reservation.where(meetroom_id: meetroom.id, dateBoth: dateBoth)
		invalid_time = @reservations.map do |res|
			
			!((timeStart.hour * 60 + timeStart.min) > (res.timeEnd.hour * 60 + res.timeEnd.min) || (timeEnd.hour * 60 + timeEnd.min) < (res.timeStart.hour * 60 + res.timeStart.min))

		end


		if invalid_time.any?
			errors.add(:timeStart, 'Already in use!')
			throw(:abort)
		end
	end


	def timestart_later_timeend
		timese = timeStart < timeEnd
		if !timese
			errors.add(:timeEnd, 'start later end')
			throw(:abort)
		end
	end

	



end
