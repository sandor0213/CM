class MeetroomsController < ApplicationController

	before_action :find_meetroom, except: [:index, :new, :create]
	before_action :destroy_earlier_reservations, only: [:show]
	before_action :authorize

	def index 
	@meetrooms = Meetroom.all

	end

	def new 
		@meetroom = Meetroom.new
	end

	def create 
		@meetroom = Meetroom.new(meetroom_params)
		if @meetroom.save
			redirect_to meetroom_path(@meetroom.id)
		end
	end

	def show 
	@members = Member.all 
	@reservations = Reservation.all.order("dateBoth ASC", "timeStart ASC")
	@resservations = Reservation.where("meetroom_id = ?", @meetroom.id)

	end

	def edit 

	end

	def update 
		if @meetroom.update(meetroom_params)
			redirect_to meetroom_path(@meetroom.id)
		else 
			render 'edit'
		end
	end

	def destroy 
		@meetroom.destroy
		redirect_to meetrooms_path
	end

	private
	def meetroom_params
		params.require(:meetroom).permit(:number, :title)
	end

	def find_meetroom
		@meetroom = Meetroom.find(params[:id])
	end

	def destroy_earlier_reservations
		@reservations = Reservation.where("dateBoth < ?", Time.now.yesterday.to_date)
		@reservations.map do |reserv|
			reserv.destroy

		end
	end

end
