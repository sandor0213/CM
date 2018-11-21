class ReservationsController < ApplicationController
		before_action :find_reservation, only: [:show, :edit, :update, :destroy]

	def index 
	end

	def new 
		@reservation = Reservation.new
	end

	def reservationwithmeetroomid
		@reservation = Reservation.new
		@meetroom = Meetroom.find(params[:id])
	end

	def createid
		@meetroom = Meetroom.find(params[:id])
		@reservation = @meetroom.reservations.build(reservation_params)
		if @reservation.save
			redirect_to root_path
		end
	end

	def create 
# @meetroom = Meetroom.first
# 		@reservation = @meetroom.reservations.build(reservation_params)
# 		if @reservation.save
# 			redirect_to root_path
# 		end

		# @reservation = Meetroom.reservations.build(reservation_params)
		# if @reservation.save
		# 	redirect_to root_path
		# end
	end

	def show 

	end

	def edit 

	end

	def update 
		if @reservation.update(reservation_params)
			redirect_to reservation_path(@reservation.id)
		end
	end

	def destroy 
		@meetroom.destroy
		redirect_to meetrooms_path
	end

	private
	def reservation_params
		params.require(:reservation).permit(:meetroom_id ,:userName, :timeStart, :timeEnd)
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

end
