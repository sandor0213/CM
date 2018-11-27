class ReservationsController < ApplicationController
		before_action :find_reservation, only: [:show, :edit, :update, :destroy]

	def index 
	end

	def reservationwithmeetroomid
		@reservation = Reservation.new
		@meetroom = Meetroom.find(params[:id])
	end

	def createid
		@meetroom = Meetroom.find(params[:id])
		@reservation = @meetroom.reservations.build(reservation_params)
		if @reservation.save
			redirect_to meetroom_path(@meetroom.id)
		end
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
		@reservation.destroy
		redirect_to meetroom_path(@reservation.meetroom_id)
	end

	private
	def reservation_params
		params.require(:reservation).permit(:meetroom_id ,:userName, :timeStart, :timeEnd)
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

end
