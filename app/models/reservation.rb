class Reservation < ApplicationRecord
	belongs_to :meetroom

	validate :already_reserved

	def already_reserved
		@reservations = Reservation.where(meetroom_id: meetroom.id, dateBoth: dateBoth)
		invalid_time = @reservations.map do |res|
			
			(timeStart.hour * 60 + timeStart.min) > (res.timeStart.hour * 60 + res.timeStart.hour)

		end

		if invalid_time.any?
			errors.add(:timeStart, 'Already in use!')
			throw(:abort)
		end
	end
end
